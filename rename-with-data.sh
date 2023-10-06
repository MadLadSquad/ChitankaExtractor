#!/bin/bash


rename_file() {
	title=$(grep -o '<title>.*</title>' "$1" | sed -E "s/<(\/?)title>//g")
	author=$(grep -o '<meta name="author" content=".*/>' "$1" | sed 's/<meta name="author" content="//g' | sed 's/" \/>//g')

	mv "$1" "$(dirname $1)"/"${author}-${title}".html 2> /dev/null
}

export -f rename_file

cpus=$(grep -c processor /proc/cpuinfo) || cpus=$(sysctl -n hw.ncpu)
find ./ -type f -name '*.html' -printf '%p\n' | parallel -j "${cpus}" rename_file || exit
