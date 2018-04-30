#!/bin/bash
set -x #echo on

source secrets.sh

./md_all.sh
#~ rm -rf $SERVER_BLOG_FOLDER/*
rsync -ravz $OUT_FOLDER $SERVER_BLOG_FOLDER # will delete files from server file!
