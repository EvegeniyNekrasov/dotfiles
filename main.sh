#!/bin/bash

source root.sh

# Installs brew and packages from Brewfile
# You can update the Brewfile by creating your own backup (bash backup.sh) or manually
source modules/brew.sh

# Restores config files backed update
source modules/configs.sh

echo "Next steps: Restart terminal to update shell changes."
