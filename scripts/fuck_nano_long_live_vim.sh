#!/usr/bin/env bash

# 🖕 Nano. Long live Vim. SpaceVim optional.
# Auto-installs vim if missing, sets editor config, and offers SpaceVim install.

# ANSI colors
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
red=$(tput setaf 1)

echo "${blue}${bold}⚙️  Setting default editor to Vim and replacing 'nano'...${normal}"

# --- Check if vim is installed ---
if ! command -v vim >/dev/null 2>&1; then
  echo "${yellow}🧃 Vim is not installed. Installing Vim...${normal}"
  sudo apt update && sudo apt install -y vim || {
    echo "${red}❌ Failed to install vim. Exiting.${normal}"
    exit 1
  }
  echo "${green}✅ Vim installed successfully.${normal}"
else
  echo "${green}✔️ Vim is already installed.${normal}"
fi

# --- BASH ---
if [ -f "$HOME/.bashrc" ]; then
  bashrc="$HOME/.bashrc"
  grep -qxF 'export EDITOR=vim' "$bashrc" || echo 'export EDITOR=vim' >> "$bashrc"
  grep -qxF 'export VISUAL=vim' "$bashrc" || echo 'export VISUAL=vim' >> "$bashrc"
  grep -qxF "alias nano='vim'" "$bashrc" || echo "alias nano='vim'" >> "$bashrc"
  echo "${green}✅ Updated: ~/.bashrc${normal}"
fi

# --- ZSH ---
if [ -f "$HOME/.zshrc" ]; then
  zshrc="$HOME/.zshrc"
  grep -qxF 'export EDITOR=vim' "$zshrc" || echo 'export EDITOR=vim' >> "$zshrc"
  grep -qxF 'export VISUAL=vim' "$zshrc" || echo 'export VISUAL=vim' >> "$zshrc"
  grep -qxF "alias nano='vim'" "$zshrc" || echo "alias nano='vim'" >> "$zshrc"
  echo "${green}✅ Updated: ~/.zshrc${normal}"
fi

# --- FISH ---
if [ -d "$HOME/.config/fish" ]; then
  fish_config="$HOME/.config/fish/config.fish"
  grep -qxF 'set -Ux EDITOR vim' "$fish_config" || echo 'set -Ux EDITOR vim' >> "$fish_config"
  grep -qxF 'set -Ux VISUAL vim' "$fish_config" || echo 'set -Ux VISUAL vim' >> "$fish_config"
  grep -qxF 'alias nano vim' "$fish_config" || echo 'alias nano vim' >> "$fish_config"
  echo "${green}✅ Updated: ~/.config/fish/config.fish${normal}"
fi

# --- Instructions ---
echo ""
echo "${bold}${yellow}🚀 NEXT STEP:${normal}"
echo "${bold}Bash users:${normal} run ${green}source ~/.bashrc${normal}"
echo "${bold}Zsh users:${normal}  run ${green}source ~/.zshrc${normal}"
echo "${bold}Fish users:${normal} run ${green}source ~/.config/fish/config.fish${normal}"
echo ""
echo "${bold}${green}✅ Nano has been exiled. Vim reigns supreme.${normal}"

# --- Offer to install SpaceVim ---
echo ""
read -rp "${blue}${bold}✨ Do you want to install SpaceVim? (y/n): ${normal}" install_spacevim
if [[ "$install_spacevim" =~ ^[Yy]$ ]]; then
  curl -sLf https://spacevim.org/install.sh | bash
  echo "${green}🚀 SpaceVim installed. Open Vim to begin the journey.${normal}"
else
  echo "${yellow}🚫 Skipped SpaceVim installation.${normal}"
fi

