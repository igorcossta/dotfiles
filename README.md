<img src="icon.svg" alt="Linux Post Install" width="128" align="left"/>

# Linux Post Install

[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE)
[![Bash Shell](https://badges.frapsoft.com/bash/v1/bash.png?v=103)](https://github.com/ellerbrock/open-source-badges/)
<br>

**DOTFILES for Java Environment and GTK Theme**

this dotfiles install a environment for Java development and change the default GNOME theme

## Installation

### Installation script

1. Clone this repo and enter folder:

   ```sh
   git clone https://github.com/igorcossta/dotfiles && cd dotfiles
   ```

2. Checkout a git branch or tag if needed, otherwise use `master` and ignore this step.

   ```sh
   git checkout beta # Set beta branch
   git checkout v1.0 # Set v1.0 tag
   ```

3. Run installation script

   #### Auto install script

   This script will install automatic all dependencies and enable the GTK theme.

   ```
   sh install.sh
   ```

## Uninstalling

1. Go to `~/.themes` and remove all inside folders
2. Go to `~/.config` and remove the gtk-4.0 folder
