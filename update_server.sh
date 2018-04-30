#!/bin/bash

source secrets.sh

./md_all.sh
rsync $OUT_FOLDER $REMOTE_SERVER # will delete files from server file!
