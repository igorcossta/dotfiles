#! /bin/bash

#
#	install theme and the dependencies
#

# https://itsfoss.com/dark-light-wallpaper-gnome/

CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"
DOWNLOAD_FOLDER="${HOME}/Downloads"

THEME_NAME='vimix-dark-doder'

if [ ! -d "${HOME}/.themes/${THEME_NAME}" ]; then
	mkdir -p ${HOME}/{.themes,.icons}

	# download theme
	git clone https://github.com/vinceliuice/vimix-gtk-themes.git ${DOWNLOAD_FOLDER}/vimix

	# extract theme
	sh ${DOWNLOAD_FOLDER}/vimix/install.sh --color dark --size standard

	# set gtk and shell theme
	gsettings set org.gnome.desktop.interface gtk-theme "${THEME_NAME}"
	dconf write /org/gnome/shell/extensions/user-theme/name "'${THEME_NAME}'"

	# set cursor
	gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"

	# set color-scheme to dark
	# https://askubuntu.com/questions/769417/how-to-change-global-dark-theme-on-and-off-through-terminal
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

	# set wallpaper
	# https://askubuntu.com/questions/1413918/update-background-via-the-commandline-ubuntu-22-04
	gsettings set org.gnome.desktop.background picture-uri-dark "file:///${CURRENT_DIR}/assets/wallpaper.jpg"
	
	# remove downloaded folder
	rm -rf ${DOWNLOAD_FOLDER}/vimix
else
	echo -e "${IBlue}" && echo "${THEME_NAME} theme is already installed!" && echo -e "${END}"
fi

