#!/bin/bash

echo "🚀 Starting mac setup..."

# Xcode CLI tools
xcode-select --install 2>/dev/null

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Ensure brew is in PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# CLI Tools
brew install git wget curl tree htop \
  nvm node python@3.11 \
  mongodb-community@7 \
  redis postgresql \
  zsh zsh-completions \
  tmux openssl jq ffmpeg gh neovim \
  docker kubectl kubectx yarn pnpm \
  zoxide lazygit

# GUI Apps
brew install --cask \
  iterm2 visual-studio-code google-chrome \
  raycast figma warp slack notion \
  postman docker mongodb-compass rectangle \
  obsidian 1password alt-tab meetingbar

# Node & Python setup
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
nvm install --lts

pip3 install --upgrade pip
pip3 install virtualenv jupyterlab openai pandas matplotlib numpy requests

# VSCode extensions
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-python.python
code --install-extension mongodb.mongodb-vscode
code --install-extension eamodio.gitlens

# Git config
git config --global user.name "Roman Vassilenko"
git config --global user.email "vassilenko@itcurated.com"
git config --global pull.rebase false

# SSH Key
echo "🔐 Generating SSH key..."
ssh-keygen -t ed25519 -C "vassilenko@itcurated.com" -f ~/.ssh/id_ed25519 -N ""
pbcopy < ~/.ssh/id_ed25519.pub
echo "✅ SSH key copied to clipboard. Add it to GitHub: https://github.com/settings/keys"

echo "🎉 Setup complete! You’re good to go."
