#! /bin/bash

# update repositories and install dependencies

sudo dnf update && sudo dnf install curl git gsettings

CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# environment variables
export CURSOR_NAME="macOS-BigSur-White"
export ICONS_PACK_NAME="Sevi"
export GTK_THEME_NAME="Jasper-Blue-Light"
export SHELL_THEME_NAME="Jasper-Blue"

export TEMP_DIR="${HOME}/.temp_files"
export ICONS_DIR="${HOME}/.icons"
export THEME_DIR="${HOME}/.themes"

# create temporary folder
if [ ! -d "${HOME}/.temp_files" ]; then
    mkdir ${HOME}/.temp_files
fi

source "${CURRENT_DIR}/script/cursor.sh"
source "${CURRENT_DIR}/script/icon.sh"
source "${CURRENT_DIR}/script/gtk-shell.sh"

# delete temporary folder
if [ -d "${HOME}/.temp_files" ]; then
    rm -rf ${HOME}/.temp_files
fi