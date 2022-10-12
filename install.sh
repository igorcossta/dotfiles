#! /bin/bash

# update repositories and install dependencies

sudo dnf update && sudo dnf install curl git gsettings

CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# create temporary folder
if [ ! -d "${HOME}/.temp_files" ]; then
    echo "creating temporary dir"
    mkdir ${HOME}/.temp_files
fi

source "${CURRENT_DIR}/script/cursor.sh"
source "${CURRENT_DIR}/script/icon.sh"
source "${CURRENT_DIR}/script/gtk-shell.sh"

# delete temporary folder
if [ -d "${HOME}/.temp_files" ]; then
    echo "deleting temporary dir"
    rm -r ${HOME}/.temp_files
fi