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

          # Run executable, capture exit status code and cleanup
          output=$("$binary_file" 2>&1)
          status=$?
          rm -f "$binary_file"

          read -r line < $oracle_file
          if [[ "$line" =~ ^-?[0-9]+$ ]]; then
            expected_status=$((line))
          else
            echo "Error: $oracle_file does not contain a valid integer"
            exit 1
          fi

          if [ $status -eq $expected_status ]; then
            echo "PASS: $rel_path ($phase)"
            ((passed++))
          else
            echo "FAIL: $rel_path ($phase)"
            echo "  subc exited with status $status, expected $expected_status"
            ((failed++))
          fi
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
