#!/bin/bash
set -x #echo on

DEFAULT_SOURCE="source/"
DEFAULT_OUT="/tmp/blog/"
cd $DEFAULT_SOURCE

mkdir $DEFAULT_OUT
FOLDERS=$(find . -type d)
MENU_FOLDERS=$(find . -type d | grep -E ".*/[^_].*\$") # use ./a, ./b, but not ./_c
MENU_FOLDERS=$(echo $MENU_FOLDERS| sed 's/\.\///g') # turn ./a/ into a/
MENU_FOLDERS=$( echo $MENU_FOLDERS | tr " " ",")

for f in $FOLDERS; do
	mkdir $DEFAULT_OUT/$f
done


cp _media/* $DEFAULT_OUT/_media/

IFS=$'\n'
for markdown_file in $(find . | grep -E "\.md$"); do
	# some path manipulation to turn "./folder/example.md" into "folder/example.md"
	markdown_file=$(echo $markdown_file | sed 's/^.\///')
	
	../pompas_md.py $markdown_file $DEFAULT_OUT --menu=$MENU_FOLDERS
done






