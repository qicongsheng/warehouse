#!/bin/bash
part1="ghp_Fl7ljrxlhdyYSndg"
part2="5AheaV9yMgH74k3OAABU"
echo "${part1}${part2}" | docker login ghcr.io -u qicongsheng --password-stdin
