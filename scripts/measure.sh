#!/usr/bin/env bash
# Deterministic part of the measurement harness: the code-size delta of a
# change. Run it on the control branch and the discipline branch of the same
# task, then compare. The non-deterministic parts (tokens, time) come from the
# agent's own usage report — see docs/measure.md.
#
# Usage:
#   ./scripts/measure.sh <base-ref> <head-ref> [label]
#   ./scripts/measure.sh main feat/x "control"
set -euo pipefail

BASE="${1:?usage: measure.sh <base-ref> <head-ref> [label]}"
HEAD="${2:?usage: measure.sh <base-ref> <head-ref> [label]}"
LABEL="${3:-$HEAD}"

read -r FILES INS DEL < <(
  git diff --numstat "$BASE" "$HEAD" | awk '
    { files++; ins += $1; del += $2 }
    END { printf "%d %d %d\n", files, ins, del }'
)
NET=$(( INS - DEL ))

printf '%-20s files=%-4s +%-6s -%-6s  net=%+d LOC\n' "$LABEL" "$FILES" "$INS" "$DEL" "$NET"
