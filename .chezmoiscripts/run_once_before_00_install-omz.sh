#!/bin/bash

echo "omz:"

# install ohmyzsh (https://ohmyz.sh/)

if [ ! -d "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Keep .zshrc close to the OMZ template while enforcing managed settings.
# fzf-tab must load before plugins that wrap completion widgets.
OMZ_PLUGINS=(
  aliases
  direnv
  eza
  fzf
  fzf-tab
  gh
  git
  gitfast
  gitignore
  zsh-autosuggestions
  zsh-syntax-highlighting
)
OMZ_PLUGINS_LINE="plugins=(${OMZ_PLUGINS[*]})"

if [ -f "$HOME/.zshrc" ]; then
  sed -i.bak \
    -e 's|^ZSH_THEME=.*$|ZSH_THEME="powerlevel10k/powerlevel10k"|' \
    -e "s|^plugins=(.*)$|$OMZ_PLUGINS_LINE|" \
    "$HOME/.zshrc"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ]; then
  git clone --depth=1 https://github.com/Aloxaf/fzf-tab.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# omz theme (https://github.com/romkatv/powerlevel10k#oh-my-zsh)
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# delta themes - https://raw.githubusercontent.com/dandavison/delta/master/themes.gitconfig
if [ ! -d "$HOME/.delta" ]; then
  git clone --depth=1 https://github.com/dandavison/delta.git $HOME/.delta
fi

# terminal themes
# https://iterm2-color-schemes-preview.vercel.app/
if [ ! -d "$HOME/.iterm2-color-schemes" ]; then
  git clone --depth=1 https://github.com/mbadolato/iterm2-color-schemes.git $HOME/.iterm2-color-schemes
fi

# notes:
# configure .p10k.zsh: runs on first zsh launch after being installed: `p10k configure`
# iterm2: font: MesloLGM Nerd Font, nerdfont-complete
# iterm2: color preset: tango dark
