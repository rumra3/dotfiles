#!/bin/bash

SRC=$(realpath $(dirname $BASH_SOURCE))

force=""
interactive=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force)
            force="-f"
            shift
            ;;
        -i|--interactive)
            interactive="-p"
            shift
            ;;
        -*|--*)
            echo "unknown option $1"
            exit 1
            ;;
        *)
            shift
            ;;
    esac
done

function findhere() {
    find "$SRC" -mindepth 1 -maxdepth 1 "$@" -exec basename {} \;
}

findhere -type d -not -name ".*" |\
    xargs $interactive -I % ln $force -sT "$SRC/%" "$HOME/.config/%"

findhere -type f -name ".*" -not -name ".gitignore" |\
    xargs $interactive -I % ln $force -sT "$SRC/%" "$HOME/%"
