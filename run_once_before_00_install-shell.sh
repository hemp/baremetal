#!/bin/bash

# -e: exit on error
# -u: exit on unset variables
set -eu

# install ohmyzsh (https://ohmyz.sh/)

if ! command -v omz >/dev/null; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# omz theme (https://github.com/romkatv/powerlevel10k#oh-my-zsh)
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# stage runtimes for shell
if [ ! -d "$HOME/.asdf" ]; then
  git clone --depth=1 https://github.com/asdf-vm/asdf.git $HOME/.asdf
fi

# delta themes - https://raw.githubusercontent.com/dandavison/delta/master/themes.gitconfig
if [ ! -d "$HOME/.delta" ]; then
  git clone --depth=1 https://github.com/dandavison/delta.git $HOME/.delta
fi

# .zshrc
case "$OSTYPE" in
  linux*)
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
    sed -i 's/plugins=(git)/plugins=(aliases asdf gh git gitignore yarn zsh-autosuggestions)/' $HOME/.zshrc    
  ;;
  darwin*)
    sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
    sed -i '' 's/plugins=(git)/plugins=(aliases asdf gh git gitignore yarn zsh-autosuggestions)/' $HOME/.zshrc
  ;; 
  win*)     echo "Windows" ;;
  msys*)    echo "MSYS / MinGW / Git Bash" ;;
  cygwin*)  echo "Cygwin" ;;
  bsd*)     echo "BSD" ;;
  solaris*) echo "Solaris" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# configure .p10k.zsh runs on first zsh launch after being installed
# p10k configure

# iterm2: font: MesloLGS NF, nerdfont-complete
# iterm2: color preset: tango dark
