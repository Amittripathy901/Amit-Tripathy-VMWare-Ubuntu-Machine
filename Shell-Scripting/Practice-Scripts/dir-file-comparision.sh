#!/bin/bash

#Compare two directories and dispay files that are different or missing between them.

DIR1="$1"
DIR2="$2"

diff -rq $DIR1 $DIR2 > /var/log/dir_cmp.log

