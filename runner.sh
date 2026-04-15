#!/bin/sh
set -e

WORDLIST=${WORDLIST:-/usr/lib/dnsscan/wordlist.txt}
OUT=/out/${TLD}.hosts.txt
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

awk -v d="$TMPDIR" '{ print > d"/w" (NR%3) }' "$WORDLIST"

i=0
pids=""
for r in 1.1.1.1 8.8.8.8 8.8.4.4; do
    gobuster dns --domain "$TLD" --quiet --wordlist "$TMPDIR/w$i" \
        --resolver "$r:53" --threads 15 --delay 10ms --no-color \
        --output "$TMPDIR/out$i" "$@" &
    pids="$pids $!"
    i=$((i+1))
done

rc=0
for p in $pids; do wait "$p" || rc=$?; done

cat "$TMPDIR"/out* 2>/dev/null | sort -u > "$OUT"
exit $rc
