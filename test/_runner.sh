#!/usr/bin/env bash

set -Euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

TEST_DIR="$script_dir/tests"
ORACLE_DIR="$script_dir/oracles"
PHASES=("lex" "parse" "irgen" "codegen" "emit" "exe")

# Parse commandline options

chapter_filter=""
phase_filter=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --chapter)
      chapter_num=$(printf "%02d" "$2")
      chapter_filter="chapter_$chapter_num"
      shift 2
      ;;
    --phase)
      phase_filter="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: $0 [--chapter 1] [--phase lex|parse|irgen|codegen|emit|exe]"
      exit 1
      ;;
  esac
done

CHAPTERS=()
for i in $(seq -f "%02g" 1 20); do
  chap="chapter_$i"
  if [[ -n "$chapter_filter" && "$chapter_filter" != "$chap" ]]; then
    continue
  fi
  CHAPTERS+=("$chap")
done

# Run tests

total=0
passed=0
failed=0
skipped=0

for chapter in "${CHAPTERS[@]}"; do

  # === Run valid tests ===

  chapter_dir="$TEST_DIR/$chapter/valid"
  if [[ -d "$chapter_dir" ]]; then

    while read -r test_file; do

      for phase in "${PHASES[@]}"; do
        if [[ -n "$phase_filter" && "$phase_filter" != "$phase" ]]; then
          continue
        fi

        # Determine oracle file extension
        if [[ "$phase" == "lex" ]]; then
          ext="tokens"
        elif [[ "$phase" == "parse" ]]; then
          ext="ast"
        elif [[ "$phase" == "irgen" ]]; then
          ext="ir"
        elif [[ "$phase" == "codegen" ]]; then
          ext="asm"
        elif [[ "$phase" == "emit" ]]; then
          ext="s"
        elif [[ "$phase" == "exe" ]]; then
          ext="exit_status"
        else
          exit 1
        fi

        rel_path="${test_file#$TEST_DIR/}"
        oracle_file="$ORACLE_DIR/${rel_path%.c}.$ext"
        binary_file="$TEST_DIR/${rel_path%.c}"

        # Skip if oracle doesn't exist
        if [[ ! -f "$oracle_file" ]]; then
          echo "SKIP: $rel_path ($phase)"
          ((skipped++))
          continue
        fi

        # Exit status test
        if [[ "$phase" == "exe" ]]; then
          # Compile executable
          subc "$test_file" -o "$binary_file"

          # Capture stdout and exit status
          program_stdout="$("$binary_file" 2>&1)"
          program_status=$?
          rm -f "$binary_file"

          # Compare exit status
          read -r line < "$oracle_file"
          if [[ "$line" =~ ^-?[0-9]+$ ]]; then
            expected_status=$((line))
          else
            echo "Error: $oracle_file does not contain a valid integer"
            exit 1
          fi

          # Exit status mismatch?
          if [[ $program_status -ne $expected_status ]]; then
            echo "FAIL: $rel_path ($phase)"
            echo "  subc exited with status $program_status, expected $expected_status"
            ((failed++))
            ((total++))
            continue
          fi

          # Compare stdout if stdout oracle exists
          stdout_oracle="${oracle_file%.exit_status}.stdout"
          if [[ -f "$stdout_oracle" ]]; then
            expected_stdout=$(<"$stdout_oracle")

            if diff -u <(echo "$expected_stdout") <(echo "$program_stdout") >/dev/null; then
              echo "PASS: $rel_path ($phase)"
              ((passed++))
            else
              echo "FAIL: $rel_path ($phase)"
              echo "  stdout mismatch:"
              diff -u <(echo "$expected_stdout") <(echo "$program_stdout") || true
              ((failed++))
            fi

          else
            # No stdout oracle, so ignore stdout
            echo "PASS: $rel_path ($phase)"
            ((passed++))
          fi

          ((total++))
          continue
        fi

        # Lexer, parser, codegen and emit tests
        if [[ "$phase" == "lex" || "$phase" == "parse" || "$phase" == "irgen" || "$phase" == "codegen" || "$phase" == "emit" ]]; then
            output=$(subc "$test_file" --"$phase" 2>&1)
            expected=$(<"$oracle_file")

            if diff -u <(echo "$expected") <(echo "$output") > /dev/null; then
              echo "PASS: $rel_path ($phase)"
              ((passed++))
            else
              echo "FAIL: $rel_path ($phase)"
              diff -u <(echo "$expected") <(echo "$output") || true
              ((failed++))
            fi
        fi

        ((total++))
      done
    done < <(find "$chapter_dir" -type f -name '*.c')
  fi

  # === Run library interoperability tests ===

  libdir="$TEST_DIR/$chapter/libraries"

  if [[ -d "$libdir" ]]; then
    for lib in "$libdir"/*; do

      # Skip client files (must match <BASE>_client.c)
      [[ "$lib" =~ _client\.c$ ]] && continue

      # Only accept .c or .s library sources
      case "$lib" in
        *.c) base=$(basename "$lib" .c) ;;
        *.s) base=$(basename "$lib" .s) ;;
        *) continue ;;
      esac

      client="$libdir/${base}_client.c"
      [[ -f "$client" ]] || continue

      rel_path="$chapter/libraries/$base"

      exit_oracle="$ORACLE_DIR/$chapter/libraries/${base}_client.exit_status"
      stdout_oracle="${exit_oracle%.exit_status}.stdout"

      if [[ ! -f "$exit_oracle" ]]; then
        echo "SKIP: $rel_path (libraries)"
        ((skipped++))
        continue
      fi

      read -r expected_status < "$exit_oracle"
      [[ "$expected_status" =~ ^-?[0-9]+$ ]] || {
        echo "Error: $exit_oracle does not contain a valid integer"
        exit 1
      }

      # CASE A: subc compiler builds library, system compiler builds client

      subc_lib_o="$libdir/${base}.o"
      sys_client_o="$libdir/${base}_client.o"

      # Build the library
      if [[ "$lib" == *.c ]]; then
        subc "$lib" -c
      else
        cc -c "$lib" -o "$subc_lib_o"
      fi

      # System compiler builds client
      cc "$client" -c -o "$sys_client_o"

      # Link and run
      cc "$subc_lib_o" "$sys_client_o" -o "$libdir/a.out"

      program_stdout="$("$libdir/a.out" 2>&1)"
      program_status=$?
      rm -f "$subc_lib_o" "$sys_client_o" "$libdir/a.out"

      interop_fail=0
      [[ "$program_status" -ne "$expected_status" ]] && interop_fail=1

      if [[ -f "$stdout_oracle" ]]; then
        expected_stdout=$(<"$stdout_oracle")
        diff -u <(echo "$expected_stdout") <(echo "$program_stdout") >/dev/null || interop_fail=1
      fi

      if [[ "$interop_fail" -eq 1 ]]; then
        echo "FAIL: $rel_path (interop A: subc lib)"
        ((failed++))
      else
        echo "PASS: $rel_path (interop A: subc lib)"
        ((passed++))
      fi
      ((total++))

      # CASE B: system compiler builds library, subc compiler builds client

      sys_lib_o="$libdir/${base}.o"
      subc_client_o="$libdir/${base}_client.o"

      # System compiler builds library:
      if [[ "$lib" == *.c ]]; then
        cc -c "$lib" -o "$sys_lib_o"
      else
        cc -c "$lib" -o "$sys_lib_o"
      fi

      # subc compiler builds client
      subc "$client" -c

      # Link and run
      cc "$sys_lib_o" "$subc_client_o" -o "$libdir/a.out"

      program_stdout="$("$libdir/a.out" 2>&1)"
      program_status=$?
      rm -f "$sys_lib_o" "$subc_client_o" "$libdir/a.out"

      interop_fail=0
      [[ "$program_status" -ne "$expected_status" ]] && interop_fail=1

      if [[ -f "$stdout_oracle" ]]; then
        expected_stdout=$(<"$stdout_oracle")
        diff -u <(echo "$expected_stdout") <(echo "$program_stdout") >/dev/null || interop_fail=1
      fi

      if [[ "$interop_fail" -eq 1 ]]; then
        echo "FAIL: $rel_path (interop B: subc client)"
        ((failed++))
      else
        echo "PASS: $rel_path (interop B: subc client)"
        ((passed++))
      fi
      ((total++))

    done
  fi

  # === Run invalid lex tests ===

  chapter_dir="$TEST_DIR/$chapter/invalid_lex"
  if [[ -d "$chapter_dir" ]]; then

    while read -r test_file; do

      phase="lex"
      if [[ -n "$phase_filter" && "$phase_filter" != "$phase" ]]; then
        continue
      fi

      rel_path="${test_file#$TEST_DIR/}"

      # Run executable, capture exit status code and cleanup
      output=$(subc "$test_file" --"$phase" 2>&1)
      status=$?

      if [ $status -ne 0 ]; then
        echo "PASS: $rel_path ($phase)"
        ((passed++))
      else
        echo "FAIL: $rel_path ($phase)"
        echo "  subc exited with a zero status"
        ((failed++))
      fi

      ((total++))
    done < <(find "$chapter_dir" -type f -name '*.c')
  fi

  # === Run invalid parser tests ===

  chapter_dir="$TEST_DIR/$chapter/invalid_parse"
  if [[ -d "$chapter_dir" ]]; then

    while read -r test_file; do

      phase="parse"
      if [[ -n "$phase_filter" && "$phase_filter" != "$phase" ]]; then
        continue
      fi

      rel_path="${test_file#$TEST_DIR/}"

      # Run executable, capture exit status code and cleanup
      output=$(subc "$test_file" --"$phase" 2>&1)
      status=$?

      if [ $status -ne 0 ]; then
        echo "PASS: $rel_path ($phase)"
        ((passed++))
      else
        echo "FAIL: $rel_path ($phase)"
        echo "  subc exited with a zero status"
        ((failed++))
      fi

      ((total++))
    done < <(find "$chapter_dir" -type f -name '*.c')
  fi

done

echo
echo "Ran $total tests: $passed passed, $failed failed", $skipped skipped
[[ $failed -eq 0 ]] || exit 1
