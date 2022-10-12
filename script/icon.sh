#! bin/bash

#
#   install icons theme
#

if [ ! -d "${ICONS_DIR}/${ICONS_PACK_NAME}" ]; then
   # download icons pack
    git clone https://github.com/TaylanTatli/Sevi.git ${TEMP_DIR}/${ICONS_PACK_NAME}
   
   # extract icons
    sh ${TEMP_DIR}/${ICONS_PACK_NAME}/install.sh --dest ${ICONS_DIR} -yellow -n ${ICONS_PACK_NAME}

   # set icons
    gsettings set org.gnome.desktop.interface icon-theme "${ICONS_PACK_NAME}"
else
	echo "${ICON_NAME} icon pack is already installed!"
fi