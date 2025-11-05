#!/usr/bin/env bash

#set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

TEST_DIR="$script_dir/tests"
ORACLE_DIR="$script_dir/oracles"

# List of chapter directories to process (chapter_01 - chapter_20)
CHAPTERS=()
for i in $(seq -f "%02g" 1 20); do
  CHAPTERS+=("chapter_$i")
done

# What phases to generate
PHASES=("lex" "parse" "validate" "irgen" "codegen" "emit" "exe")

# Loop over test files
for chapter in "${CHAPTERS[@]}"; do
  chapter_dir="$TEST_DIR/$chapter"

  # Skip if chapter directory doesn't exist yet
  [[ -d "$chapter_dir" ]] || continue

  # Find all .c files inside the chapter valid directory
  find "$chapter_dir/valid" -type f -name '*.c' | while read -r test_file; do
    for phase in "${PHASES[@]}"; do
      case "$phase" in
        lex) ext="tokens" ;;
        parse) ext="ast" ;;
        validate) ext="validate" ;;
        irgen) ext="ir" ;;
        codegen) ext="asm" ;;
        emit) ext="s" ;;
        exe) ext="exit_status" ;;
        *) echo "Unknown phase: $phase"; exit 1 ;;
      esac

      # Relative path from test dir and target oracle path
      rel_path="${test_file#$TEST_DIR/}"
      oracle_file="${rel_path%.c}.$ext"
      oracle_path="$ORACLE_DIR/$oracle_file"

      # Ensure output directory exists
      mkdir -p "$(dirname "$oracle_path")"

      echo "Generating oracle: $oracle_file"
      if [[ $phase == "exe" ]]; then
        exe_file="${test_file%.c}"
        subc "$test_file" -o "$exe_file"
        if [[ -x "$exe_file" ]]; then
          "$exe_file"
          echo $? > "$oracle_path"
          rm -f "$exe_file"
        else
          echo "Executable not found: $exe_file" >&2
          echo 127 > "$oracle_path"
        fi
      else
        subc "$test_file" --"$phase" > "$oracle_path"
      fi
    done
  done
done
