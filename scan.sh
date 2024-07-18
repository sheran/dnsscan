#!/bin/sh
docker run --rm -dit -e TLD=$1 -v $(pwd):/out --name $1 dnsscan
