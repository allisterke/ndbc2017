#!/bin/bash

FILE=ndbc2017.tgz

rm -f $FILE

tar czf $FILE images *.js *.css *.pdf $(ls *.html | grep -v '\.meta\.' | grep -v template)
