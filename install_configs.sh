#!/bin/bash

# Function to check if a package is installed
check_and_install() {
    PACKAGE=$1
    if ! dpkg -l | grep -q "^ii  $PACKAGE"; then
        echo "$PACKAGE is not installed. Installing..."
        sudo apt update
        sudo apt install -y $PACKAGE
    else
        echo "$PACKAGE is already installed."
    fi
}

# Check and install required applications
check_and_install "rofi"
check_and_install "terminator"
check_and_install "zsh"
check_and_install "git"  # Ensure git is installed for cloning repositories
check_and_install "kwrite"  # Install kwrite

# Clone the repository if it hasn't been cloned yet
if [ ! -d "$HOME/config" ]; then
    git clone https://github.com/ncoder00/kalidots.git $HOME/config
fi

# Navigate to the config directory
cd $HOME/config

# Pull the latest changes
git pull origin main

# Restore XFCE panel profile
mkdir -p $HOME/.local/share/xfce4-panel-profiles/
cp -r $HOME/config/xfce4-panel-profiles/Main_Panel.tar.bz2 $HOME/.local/share/xfce4-panel-profiles/

# Restore Kwrite configuration
cp -u $HOME/config/kwriterc $HOME/.config/kwriterc

# Create necessary directories
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/terminator

# Symlink the configuration files
ln -sf $HOME/config/.zshrc $HOME/.zshrc
ln -sf $HOME/config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -sf $HOME/config/terminator/config $HOME/.config/terminator/config

echo "Applications checked, XFCE panel profile, Kwrite settings, and configurations have been installed."
