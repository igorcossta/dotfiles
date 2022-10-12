#! bin/bash

#
#   install cursor theme
#

CURSOR_NAME='macOS-BigSur-White'
TEMP_FILE="${HOME}/.temp_files"
DEST_FILE="${HOME}/.icons"

if [ ! -d "${DEST_FILE}/${CURSOR_NAME}" ]; then
   # download cursor
   curl -L -o ${TEMP_FILE}/cursor.tar.gz https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur-White.tar.gz
   
   # extract cursor
   echo "installing cursor at ${DEST_FILE}/${CURSOR_NAME}"
   tar -xf ${TEMP_FILE}/cursor.tar.gz -C ${DEST_FILE}

   # set cursor
   gsettings set org.gnome.desktop.interface cursor-theme "${CURSOR_NAME}"
else
	echo "${CURSOR_NAME} cursor is already installed!"
fi