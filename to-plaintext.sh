#!/bin/bash
convert_to_plaintext() {
	result=$(grep "<p>" "$1" | sed -E "s/(<(\/?)p>)|(<span.*<\/span>)|(<em.*<\/em>)|(<li.*<\/li>)|(<(\/?)strong>)|(<a.*<\/a>)|(<.* \/>)|(<(\/?)sup>)//g" | head -n -3 | tail -n +4)
	#sed -E "s/<a.*<\/a>//g" | sed -E "s/<em.*<\/em>//g" | sed -E "s/<li.*<\/li>//g" | sed -E "s/<>//g" | head -n -3 | tail -n +4)
	echo "${result}" > "$1"
}

export -f convert_to_plaintext

cpus=$(grep -c processor /proc/cpuinfo) || cpus=$(sysctl -n hw.ncpu)
files=$(find ./ -type f -name '*.html' -printf '%p\n')
echo "${files}" | parallel -j "${cpus}" convert_to_plaintext || exit
