#!/usr/bin/env bash
set -ex

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Ensure that some dirs exist
mkdir -p ~/.config
mkdir -p ~/.local/{bin,local,lib}

echo "Installing fish configuration..."
rm -rf ~/.config/fish
ln -sF ${DOTFILES}/fish/ ~/.config

echo "Installing tmux config"
ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf

echo "Configuring NeoVIM and installing bundles..."

rm -f ~/.config/nvim
ln -sF ${DOTFILES}/nvim ~/.config/nvim
#  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "installing terminfos"
tic -x misc/xterm-256color-italic.terminfo
tic -x misc/tmux-256color.terminfo

cd ~/.local/share/nvim/lazy/coc.nvim
yarn install
yarn build

echo "Setup Complete!"

# echo "Add the following to ~/.bashrc: export PATH=${DOTFILES}/bin:\$PATH"
