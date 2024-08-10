#!/bin/bash

# Define the source locations of your configuration files
ZSHRC_SOURCE="$HOME/.zshrc"
ROFI_SOURCE="$HOME/.config/rofi/config.rasi"
TERMINATOR_SOURCE="$HOME/.config/terminator/config"
ICONS_SOURCE="$HOME/.local/share/icons/We10X-green-dark"

# Define the destination directory
CONFIG_DIR="/home/ncoder0/config"

# Copy the latest configuration files to the config directory
cp -u "$ZSHRC_SOURCE" "$CONFIG_DIR/"
mkdir -p "$CONFIG_DIR/rofi"
cp -u "$ROFI_SOURCE" "$CONFIG_DIR/rofi/"
mkdir -p "$CONFIG_DIR/terminator"
cp -u "$TERMINATOR_SOURCE" "$CONFIG_DIR/terminator/"
cp -u -r "$ICONS_SOURCE" "$CONFIG_DIR/icons/"

# Navigate to the config directory
cd "$CONFIG_DIR"

# Stage all changes
git add .

# Commit changes with a message
git commit -m "Updated config files on $(date)"

# Push to the GitHub repository
git push origin main

echo "Configurations have been updated and pushed to GitHub."
