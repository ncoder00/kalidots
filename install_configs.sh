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

# Clone the repository if it hasn't been cloned yet
if [ ! -d "$HOME/config" ]; then
    git clone https://github.com/ncoder00/kalidots.git $HOME/config
fi

# Navigate to the config directory
cd $HOME/config

# Pull the latest changes
git pull origin main

# Clone We10X icon theme to Downloads if not already cloned
if [ ! -d "$HOME/Downloads/We10X-icon-theme" ]; then
    git clone https://github.com/yeyushengfan258/We10X-icon-theme.git $HOME/Downloads/We10X-icon-theme
    echo "We10X-icon-theme cloned to Downloads."
else
    echo "We10X-icon-theme already exists in Downloads."
fi

# Clone Juno theme to Downloads if not already cloned
if [ ! -d "$HOME/Downloads/Juno" ]; then
    git clone https://github.com/EliverLara/Juno.git $HOME/Downloads/Juno
    echo "Juno theme cloned to Downloads."
else
    echo "Juno theme already exists in Downloads."
fi

# Create necessary directories
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/terminator

# Symlink the configuration files
ln -sf $HOME/config/.zshrc $HOME/.zshrc
ln -sf $HOME/config/rofi/config.rasi $HOME/.config/rofi/config.rasi
ln -sf $HOME/config/terminator/config $HOME/.config/terminator/config

echo "Applications checked, repositories cloned to Downloads, and configurations have been installed."
