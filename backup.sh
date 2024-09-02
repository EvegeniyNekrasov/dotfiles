#!/bin/bash

source root.sh

echo -e "${ARROW}Removind previous backup..."
rm -rf backup/.config/*

echo -e "${ARROW}Backing up dotfilles..."
cp -R -p -v ~/.config $BACKUP_DIR
cp -v ~/.zprofile $BACKUP_DIR
cp -v ~/.zshrc $BACKUP_DIR

echo -e "${ARROW}Creating Brewfile..."
brew bundle dump -v -f --file $BACKUP_DIR/Brewfile

echo -e "${ARROW}Done!${RESET}"
