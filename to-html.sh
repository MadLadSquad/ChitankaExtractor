#!/bin/bash

extract() {
	printf "%s\n" "${1}"
	pandoc -s "${1}" -o `dirname $1`/`basename $1 epub`html
}

export -f extract

cpus=$(grep -c processor /proc/cpuinfo) || cpus=$(sysctl -n hw.ncpu)
find ./ -type f -name '*.epub' -printf '%p\n' | parallel -j "${cpus}" extract || exit
