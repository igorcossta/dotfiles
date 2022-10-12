#! bin/bash

#
#   install cursor theme
#

if [ ! -d "${ICONS_DIR}/${CURSOR_NAME}" ]; then
   # download cursor
   curl -L -o ${TEMP_DIR}/cursor.tar.gz https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur-White.tar.gz
   
   # extract cursor
   tar -xf ${TEMP_DIR}/cursor.tar.gz -C ${ICONS_DIR}

   # set cursor
   gsettings set org.gnome.desktop.interface cursor-theme "${CURSOR_NAME}"
else
	echo "${CURSOR_NAME} cursor is already installed!"
fi