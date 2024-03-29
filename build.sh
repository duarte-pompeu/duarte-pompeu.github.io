#!/bin/bash
# similar: https://wstyler.ucsd.edu/posts/pandoc_website.html

cd src/
folders=$(find . -type "d" | sed "s/.\///")
md_files=$(find . | sed "s/.\///" | grep -E ".md\$")
cd ..



mkdir web
cd web/


for f in $folders; do
    mkdir $f
done
cd - > /dev/null

for f in $folders; do
    in=src/$f
    cd $in
    md_files=$(ls . | grep -E ".md\$")

    cd - > /dev/null

    for md in $md_files; do
        in=src/$f/$md

        sed_expr1="s/\^\.\///" # ommit ./ from filenames
        sed_expr2="s/\.md\$//" # ommit .md from html_filenames
        out=$(echo web/$f/$md | sed $sed_expr1 | sed $sed_expr2).html

        # echo $in
        # echo $out

        before=src/$f/_b.html
        after=src/$f/_a.html

        pandoc $in -B $before -A $after --standalone > $out

    done
done

cp src/*.css web/