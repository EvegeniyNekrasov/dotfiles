#!/bin/bash

source root.sh

# Installs brew and packages from Brewfile
# You can update the Brewfile by creating your own backup (bash backup.sh) or manually
source modules/brew.sh

# Restores config files backed update
source modules/configs.sh

DOTFILES_DIR=$(pwd)
CONFIG_DIR="$HOME/.config"

# Create necessary directories
mkdir -p $CONFIG_DIR/wezterm/colors
mkdir -p $CONFIG_DIR/starship

cp -R -p -i $DOTFILES_DIR/wezterm/wezterm.lua $CONFIG_DIR/wezterm/
cp -R -p -i $DOTFILES_DIR/wezterm/colors/tokyonight_night.toml $CONFIG_DIR/wezterm/colors/

# Copy starship.toml directly to .config
cp -R -p -i $DOTFILES_DIR/starship/starship.toml $CONFIG_DIR/

echo "Next steps: Restart terminal to update shell changes."
