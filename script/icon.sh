#! bin/bash

#
#   install icons theme
#

ICON_NAME='Sevi'
TEMP_FILE="${HOME}/.temp_files"
DEST_FILE="${HOME}/.icons"

if [ ! -d "${DEST_FILE}/${ICON_NAME}" ]; then
   # download icons pack
   git clone https://github.com/TaylanTatli/Sevi.git ${TEMP_FILE}/${ICON_NAME}
   
   # extract icons
   echo "installing icons at ${DEST_FILE}/${ICON_NAME}"
   sh ${TEMP_FILE}/${ICON_NAME}/install.sh --dest ${HOME}/.icons -yellow -n ${ICON_NAME}

   # set icons
   gsettings set org.gnome.desktop.interface icon-theme "${ICON_NAME}"
else
	echo "${ICON_NAME} icon pack is already installed!"
fi