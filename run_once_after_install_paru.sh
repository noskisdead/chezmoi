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

  # openvpn # VPN for cybersecurity, Hack The Box and TryHackMe
  # nmap    # Port Enumeration
  # sqlmap  # Tool for automating SQL Injections
  # gobuster
  # ffuf-bin
  # hydra
  # metasploit
  # python2-bin
  # exploitdb
  # wireshark-qt
  # seclists
  # rockyou
  # wifite
  # aircrack-ng
  # hashcat
  # burpsuite
  # john
  # nikto
  # responder
  # gnu-netcat
  # impacket
  # reaver
  # mdk4
  # macchanger
  # bettercap
  # hash-identifier

  # ---------------------------
  # 🎮 Gaming
  # ---------------------------

  # Game Launchers
  slippi-launcher-bin       # Super Smash Bros. Melee Online
  heroic-games-launcher-bin # DRM-Free, GOG and Epic Games launcher
  prismlauncher             # Minecraft Launcher
  steam                     # Gaming Library
  eden-bin                  # Switch Emulator
  gamemode                  # Game optimization tool
  gamescope                 # Game optimization tool

  # ---------------------------
  # 💼 Productivity
  # ---------------------------

  # Editors & Notes
  obsidian       # Notes app
  neovim         # Text Editor
  onlyoffice-bin # Office suite

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
  mpv # Video Player

  # Music
  spotify # Music Player

  # Images
  eog # Image Viewer

  # ---------------------------
  # 🌐 Internet & Communication
  # ---------------------------

  zen-browser-bin # Web Browser
  # kdeconnect      # Connect phone to PC, sync notifications, etc...
  localsend # Share files from every device
  vesktop   # Modded Discord client

  # ---------------------------
  # 🧪 Fun / Miscellaneous
  # ---------------------------

  pokego-bin        # Pokemon ascii
  qbittorrent       # Torrenting client
  mullvad-vpn-bin   # VPN client
  unrar             # RAR decompression support
  lucidglyph        # Font adjustements
  ttf-ms-fonts      # Microsoft Fonts
  apple-fonts       # Apple Fonts
  7zip              # 7Z format support
  linux-headers     # Drivers
  android-udev      # Android USB Support
  gcadapter-oc-dkms # Overclock GameCube Adapter
  yazi              # File Manager
)

echo "[chezmoi] Installing packages with paru..."
paru -S --needed --noconfirm "${packages[@]}"
echo "[chezmoi] Package installation complete."

echo "[chezmoi] Configuring Starship..."
starship preset nerd-font-symbols -o ~/.config/starship/starship.toml
echo "[chezmoi] Starship was configured successfully."

echo "[chezmoi] Configuring Fish..."
fish -c 'fisher install catppuccin/fish jorgebucaran/autopair.fish icezyclon/zoxide.fish patrickf1/fzf.fish fishingline/safe-rm'
echo "y" | fish -c 'fish_config theme save "Catppuccin Macchiato"'
echo "[chezmoi] Fish was configured successfully."
