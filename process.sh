#! /bin/bash

pandoc -w html5 -o lectures/"$1"/lecture.html -s -S --mathjax -A includes.txt lectures/"$1"/lecture.md

#pandoc -w dzslides --template deck-template.html -S --mathjax -H includes.txt --number-sections --email-obfuscation=none -o "$1"/deck.slides.html "$1"/lecture.md
