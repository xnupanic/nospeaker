#!/usr/bin/env bash
# Play one randomly selected phrase through NO SPEAKER.
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
local_binary="$repo_dir/nospeaker"
installed_binary="$HOME/.local/bin/nospeaker"

# Prefer a binary built in this checkout; otherwise use the curl-installed copy.
if [[ -x "$local_binary" ]]; then
    binary="$local_binary"
elif [[ -x "$installed_binary" ]]; then
    binary="$installed_binary"
else
    printf 'Error: NO SPEAKER was not found. Build it with ./build.sh or install it with:\n' >&2
    printf '  curl -fsSL a90.com/nospeaker | sh\n' >&2
    exit 1
fi

phrases=(
    "I always feel like...somebody's watching meeee"
    "I like your hair today."
    "This computer will self destruct in 10...9...8...7...6...5...4...3...2....self destruct aborted."
)

phrase_index=$((RANDOM % ${#phrases[@]}))
"$binary" "${phrases[$phrase_index]}"
