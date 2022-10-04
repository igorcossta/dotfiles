#! /bin/bash

#
#	install zsh and the dependencies
#

#
# //dark
# alias dark='gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark \
# && gsettings set org.gnome.desktop.interface color-scheme prefer-dark'
# //light
# alias light='gsettings set org.gnome.desktop.interface gtk-theme Adwaita \
# && gsettings set org.gnome.desktop.interface color-scheme prefer-light'
#

if [ ! -f /bin/zsh ]; then	
	# install zsh
	sudo dnf install zsh
	
	# make zsh my default shell
	chsh -s $(which zsh)
	
	# install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	# install plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	
	echo -e "${IGreen}" && echo "Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):"
	echo "plugins=(other plugins... zsh-autosuggestions zsh-syntax-highlighting)" && echo -e "${END}"
	
else
	echo -e "${IBlue}" && echo "zsh, oh-my-zsh & plugins is already installed!" && echo -e "${END}"
fi

