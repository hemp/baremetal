#!/bin/bash

# install ohmyzsh (https://ohmyz.sh/)

if [ ! -d "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # .zshrc - minimize .zshrc changes. @see 00_dotfiles.zsh
  case "$OSTYPE" in
    linux*)
      sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
      sed -i 's/plugins=(git)/plugins=(aliases asdf brew direnv eza fzf gh git gitignore yarn zsh-autosuggestions zsh-syntax-highlighting)/' $HOME/.zshrc
    ;;
    darwin*)
      sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
      sed -i '' 's/plugins=(git)/plugins=(aliases asdf brew direnv eza fzf gh git gitignore yarn zsh-autosuggestions zsh-syntax-highlighting)/' $HOME/.zshrc
    ;; 
    win*)     echo "Windows" ;;
    msys*)    echo "MSYS / MinGW / Git Bash" ;;
    cygwin*)  echo "Cygwin" ;;
    bsd*)     echo "BSD" ;;
    solaris*) echo "Solaris" ;;
    *)        echo "unknown: $OSTYPE" ;;
  esac
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

# stage runtimes for shell
if [ ! -d "$HOME/.asdf" ]; then
  git clone --depth=1 https://github.com/asdf-vm/asdf.git $HOME/.asdf
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
# iterm2: font: MesloLGS NF, nerdfont-complete
# iterm2: color preset: tango dark
