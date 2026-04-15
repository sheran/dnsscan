#!/bin/sh
unbound
gobuster dns --domain $TLD --quiet --wordlist /usr/lib/dnsscan/wordlist.txt --resolver 127.0.0.1:5335 --threads 15 --delay 10ms --no-color --ooutput /out/${TLD}.hosts.txt "$@"
