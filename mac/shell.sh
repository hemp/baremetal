#!/bin/bash

mkdir -p ~/.config/fd
cp config.fd.ignore ~/.config/fd/ignore

mkdir -p ~/.config/nvim
# cp neovim-init.lua ~/.config/nvim/init.lua
# NvChad, LazyVim, LunarVim, kickstart.nvim
# NvChad: theme tundra

# install ohmyzsh (https://ohmyz.sh/)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exec zsh
cp dotfiles.zsh $ZSH_CUSTOM/dotfiles.zsh

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# theme (https://github.com/romkatv/powerlevel10k#oh-my-zsh)

[ -f ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# stage runtimes for shell
git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.asdf

# .zshrc
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i '' 's/plugins=(git)/plugins=(aliases asdf gh git gitignore yarn zsh-autosuggestions)/' ~/.zshrc
exec zsh

# configure .p10k.zsh
p10k configure

# iterm2: font: MesloLGS NF, nerdfont-complete
# iterm2: color preset: tango dark

# git config
cp gitconfig ~/.gitconfig
cp gitignore_global ~/.gitignore_global

# vscode settings
cp vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

# delta
# https://raw.githubusercontent.com/dandavison/delta/master/themes.gitconfig
git clone --depth=1 https://github.com/dandavison/delta.git $HOME/.delta
