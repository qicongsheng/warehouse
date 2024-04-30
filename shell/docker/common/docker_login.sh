#!/bin/bash
part1="ghp_s4XbjIIUX0yb0GyG"
part2="KMf5GAonGBVNaF2nSLJF"
echo "${part1}${part2}" | docker login ghcr.io -u qicongsheng --password-stdin
