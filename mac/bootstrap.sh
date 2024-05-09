#!/bin/sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install just
# install oh my zsh and zsh is not installed
ln -s ~/dotfiles/mac/alias/init.zsh $ZSH_CUSTOM/init.zsh

ln -s ~/dotfiles/mac/nvim ~/.config/nvim

git config --global author.name "Roman Schweitzer"
git config --global author.email "roman.schweitzer@gmail.com"
