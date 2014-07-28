#! /bin/bash

pandoc -w html5 -o "$1"/lecture.html -s -S --mathjax -H includes.txt "$1"/lecture.md