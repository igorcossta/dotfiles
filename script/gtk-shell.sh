#! bin/bash

#
#   install gtk and shell theme
#

GTK_NAME='Jasper-Blue-Light'
SHELL_NAME='Jasper-Blue'
TEMP_FILE="${HOME}/.temp_files"
DEST_FILE="${HOME}/.themes"

if [ ! -d "${DEST_FILE}/${GTK_NAME}" ]; then
   # download theme
   git clone https://github.com/vinceliuice/Jasper-gtk-theme.git ${TEMP_FILE}/theme
   
   # extract gtk and shell
   echo "installing theme at ${DEST_FILE}/${GTK_NAME}"
   sh ${TEMP_FILE}/theme/install.sh -t blue

   # set gtk and shell
   gsettings set org.gnome.desktop.interface gtk-theme "${GTK_NAME}"
   dconf write /org/gnome/shell/extensions/user-theme/name "'${SHELL_NAME}'"

   # set scheme color to light
   gsettings set org.gnome.desktop.interface color-scheme 'default'

   # link libadwaita (gnome 42+)
    if [[ "$(command -v gnome-shell)" ]]; then
        SHELL_VERSION="$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f -1)"
        if [[ $SHELL_VERSION -lt 42 ]]; then
            echo 'SKIPING LINK LIBADWAITA PROCCESS (GNOME 42^)'
        else
            echo 'LINK LIBADWAITA PROCCESS STARTED'
            mkdir -p "${HOME}/.config/gtk-4.0"
            ln -sf "${DEST_FILE}/${GTK_NAME}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
            ln -sf "${DEST_FILE}/${GTK_NAME}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
            ln -sf "${DEST_FILE}/${GTK_NAME}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
        fi
    fi
else
	echo "${GTK_NAME} theme is already installed!"
fi