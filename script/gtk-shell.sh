#! bin/bash

#
#   install gtk and shell theme
#

if [ ! -d "${THEME_DIR}/${GTK_THEME_NAME}" ]; then
   # download theme
    git clone https://github.com/vinceliuice/Jasper-gtk-theme.git ${TEMP_DIR}/${GTK_THEME_NAME}
   
   # extract gtk and shell
    sh ${TEMP_DIR}/${GTK_THEME_NAME}/install.sh -t blue

   # set gtk and shell
    gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_NAME}"
    dconf write /org/gnome/shell/extensions/user-theme/name "'${SHELL_THEME_NAME}'"

   # set scheme color to light
   gsettings set org.gnome.desktop.interface color-scheme 'default'

   # link libadwaita (gnome 42+)
    if [[ "$(command -v gnome-shell)" ]]; then
        SHELL_VERSION="$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f -1)"
        if [[ $SHELL_VERSION -lt 42 ]]; then
            echo 'SKIPING LINK LIBADWAITA PROCCESS (GNOME 42^)'
        else
            mkdir -p "${HOME}/.config/gtk-4.0"
            ln -sf "${THEME_DIR}/${GTK_THEME_NAME}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
            ln -sf "${THEME_DIR}/${GTK_THEME_NAME}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
            ln -sf "${THEME_DIR}/${GTK_THEME_NAME}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
        fi
    fi
else
	echo "${GTK_NAME} theme is already installed!"
fi