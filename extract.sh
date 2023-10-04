#!/bin/bash
#for i in `find ./ -type f -name '*.epub' -printf '%p\n'`; do
	printf "%s\n" "${1}"
	pandoc -s "${1}" -o `dirname $1`/`basename $1 epub`html
#done
