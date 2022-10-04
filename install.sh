#! /bin/bash

# https://askubuntu.com/questions/1095057/how-to-revert-the-results-of-gsettings-set-org-gnome-desktop-command

# update repositories and install dependencies

sudo dnf update && sudo dnf install curl git gsettings

CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"

source "${CURRENT_DIR}/script/colors.sh"
source "${CURRENT_DIR}/script/theme.sh"
source "${CURRENT_DIR}/script/zsh.sh"
