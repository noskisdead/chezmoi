#!/bin/bash

set -euo pipefail

# Check if paru is installed
if ! command -v paru &>/dev/null; then
  echo "❌ paru is not installed. Please install paru first."
  exit 1
fi

# List of packages to install (grouped by category and subcategory)
packages=(
  # ---------------------------
  # 🛡️ Cybersecurity
  # ---------------------------

  openvpn # VPN for cybersecurity, Hack The Box and TryHackMe
  sqlmap  # Tool for automating SQL Injections

  # ---------------------------
  # 🎮 Gaming
  # ---------------------------

  # Game Launchers
  slippi-launcher-bin       # Super Smash Bros. Melee Online
  heroic-games-launcher-bin # DRM-Free, GOG and Epic Games launcher
  prismlauncher             # Minecraft Launcher
  steam                     # Gaming Library
  eden-bin                  # Switch Emulator

  # Gaming Accessories
  wii-u-gc-adapter # Gamecube controller adapter

  # ---------------------------
  # 💼 Productivity
  # ---------------------------

  # Editors & Notes
  obsidian # Notes app
  neovim   # Text Editor

  # Shell & CLI Enhancements
  bat      # Better cat command
  tealdeer # TLDR man pages
  zoxide   # Better cd command
  man-db   # Manual pages for every command
  fisher   # Fish shell addons

  # ---------------------------
  # 🎵 Media
  # ---------------------------

  # Video
  mpv               # Video Player
  mpv-thumbfast-git # MPV addon for ModernX
  mpv-modernx-git   # MPV Skin

  # Music
  spotify # Music Player

  # Images
  eog # Image Viewer

  # ---------------------------
  # 🌐 Internet & Communication
  # ---------------------------

  zen-browser-bin # Web Browser
  kdeconnect      # Connect phone to PC, sync notifications, etc...

  # ---------------------------
  # 🧪 Fun / Miscellaneous
  # ---------------------------

  pokego-bin      # Pokemon ascii
  qbittorrent     # Torrenting client
  mullvad-vpn-bin # VPN client
)

echo "[chezmoi] Installing packages with paru..."
paru -S --needed --noconfirm "${packages[@]}"
echo "[chezmoi] Package installation complete."

echo "[chezmoi] Configuring Fish..."
fish -c 'fisher install catppuccin/fish jorgebucaran/autopair.fish icezyclon/zoxide.fish patrickf1/fzf.fish fishingline/safe-rm'
echo "y" | fish -c 'fish_config theme save "Catppuccin Macchiato"'
echo "[chezmoi] Fish was configured successfully."
