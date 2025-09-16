#!/usr/bin/env bash

set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

TEST_DIR="$script_dir/tests"
ORACLE_DIR="$script_dir/oracles"

# List of chapter directories to process (chapter_01 - chapter_20)
CHAPTERS=()
for i in $(seq -f "%02g" 1 20); do
  CHAPTERS+=("chapter_$i")
done

# What phases to generate
PHASES=("lex" "parse")

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
        *) echo "Unknown phase: $phase"; exit 1 ;;
      esac

      # Relative path from test dir and target oracle path
      rel_path="${test_file#$TEST_DIR/}"
      oracle_file="$ORACLE_DIR/${rel_path%.c}.$ext"

      # Ensure output directory exists
      mkdir -p "$(dirname "$oracle_file")"

      echo "Generating oracle: $oracle_file"
      subc "$test_file" --"$phase" > "$oracle_file"
    done
  done
done
