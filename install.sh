#!/bin/bash

SRC=$(realpath $(dirname $BASH_SOURCE))

interactive=""
if [ "$1" == "--interactive" ]; then
    interactive="-p"
fi

function findhere() {
    find "$SRC" -mindepth 1 -maxdepth 1 "$@" -exec basename {} \;
}

findhere -type d -not -name ".*" |\
    xargs $interactive -I % ln -sT "$SRC/%" "$HOME/.config/%"

findhere -type f -name ".*" -not -name ".gitignore" |\
    xargs $interactive -I % ln -sT "$SRC/%" "$HOME/%"
