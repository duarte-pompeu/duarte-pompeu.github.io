#!/bin/bash
set -x #echo on

rm -rf ./blog/*
cd source/

FOLDERS=$(find . -type d)

for f in $FOLDERS; do
	mkdir ../blog/$f
done

IFS=$'\n'
for markdown in $(find . | grep -E "\.md$"); do
	# some path manipulation to turn "./folder/example.md" into "folder/example.md"
	file=$(echo $markdown | sed 's/^.\///')
	
	../pompas_md.py $file ../blog
done






