#!/bin/sh
docker run --rm -dit -e TLD=$1 -v ./$2:/usr/lib/dnsscan/wordlist.txt -v $(pwd):/out --name $1 dnsscan
