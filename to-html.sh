#!/bin/bash
cpus=$(grep -c processor /proc/cpuinfo) || cpus=$(sysctl -n hw.ncpu)
find ./ -type f -name '*.epub' -printf '%p\n' | parallel -j "${cpus}" ./extract.sh || exit
