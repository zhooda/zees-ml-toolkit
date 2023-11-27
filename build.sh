#!/bin/bash

if [ $# -eq 0 ]; then
    echo "usage: build.sh [toolkit|hiring]"
    exit 1
fi

target=$1

case $target in
    "toolkit")
        echo "rendering zees-ml-toolkit..."
        pandoc --citeproc src/zees-ml-toolkit.md -o pdf/zees-ml-toolkit.pdf
        ;;
    "hiring")
        echo "rendering zees-ml-hiring-notes..."
        pandoc --citeproc --pdf-engine=xelatex src/zees-ml-hiring-notes.md -o pdf/zees-ml-hiring-notes.pdf
        ;;
    *)
        echo "usage: build.sh [toolkit|hiring]"
        exit 1
        ;;
esac
