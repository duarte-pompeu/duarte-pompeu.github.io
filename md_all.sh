#!/bin/bash

cd source/

IFS=$'\n'
for markdown in $(find . | grep -E "\.md$"); do
	echo $markdown
	../pompas_md.py $markdown ../blog 
done
