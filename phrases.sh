#!/usr/bin/env bash
# Play one randomly selected phrase through the locally built nospeaker binary.
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
binary="$repo_dir/nospeaker"

if [[ ! -x "$binary" ]]; then
    printf 'Error: %s is missing or not executable. Build it first with ./build.sh.\n' "$binary" >&2
    exit 1
fi

phrases=(
    "I always feel like...somebody's watching meeee"
    "I like your hair today."
    "This computer will self destruct in 10...9...8...7...6...5...4...3...2....self destruct aborted."
)

phrase_index=$((RANDOM % ${#phrases[@]}))
"$binary" "${phrases[$phrase_index]}"
