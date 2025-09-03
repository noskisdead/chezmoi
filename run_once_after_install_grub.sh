#!/usr/bin/env bash

# Exit on error
set -e

# Define theme variables
THEME_NAME="catppuccin-mocha-grub-theme"
THEME_DIR="/boot/themes/$THEME_NAME"
REPO_URL="https://github.com/catppuccin/grub.git"

echo "[chezmoi] Installing Catppuccin Mocha GRUB theme..."

# Clone the theme repository
git clone --depth=1 "$REPO_URL" /tmp/catppuccin-grub

# Create theme directory
sudo mkdir -p "$THEME_DIR"

# Copy Mocha theme files
sudo cp -r /tmp/catppuccin-grub/src/catppuccin-mocha-grub-theme/* "$THEME_DIR"

# Set theme in GRUB config
echo "[chezmoi] Setting theme in GRUB configuration..."
sudo sed -i "/^GRUB_THEME=/d" /etc/default/grub
echo "GRUB_THEME=\"$THEME_DIR/theme.txt\"" | sudo tee -a /etc/default/grub >/dev/null

# Set GRUB timeout to 1 second
sudo sed -i "/^GRUB_TIMEOUT=/d" /etc/default/grub
echo "GRUB_TIMEOUT=1" | sudo tee -a /etc/default/grub >/dev/null

# Update GRUB
echo "[chezmoi] Updating GRUB..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Cleanup
rm -rf /tmp/catppuccin-grub

echo "[chezmoi] Catppuccin Mocha grub theme installed!"
