#!/bin/sh
unbound
gobuster dns -d $TLD -q -w /usr/lib/dnsscan/wordlist.txt -r 127.0.0.1:5335 -t 15 --delay 10ms --no-color -o /out/${TLD}.hosts.txt "$@"
