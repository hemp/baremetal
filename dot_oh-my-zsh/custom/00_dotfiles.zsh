# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
#
# Files in the custom/ directory will be:
# - loaded automatically by the init script, in alphabetical order
# - loaded last, after all built-ins in the lib/ directory, to override them
# - ignored by git by default
#
# Example: add custom/shortcuts.zsh for shortcuts to your local projects
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# one day: 86400
# five days: 432000
export HOMEBREW_AUTO_UPDATE_SECS=432000
export HOMEBREW_BUNDLE_FILE="$HOME/.config/homebrew/Brewfile"

# Avoid issues with `gpg` (installed via Homebrew)
# Ref: https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$TTY

# https://github.com/junegunn/fzf?tab=readme-ov-file#environment-variables
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://github.com/junegunn/fzf/issues/164
bindkey "ç" fzf-cd-widget

if command -v broot >/dev/null; then
  source <(broot --print-shell-function zsh)
fi

alias _clock="tty-clock -s -c -C 2"
alias _ohmyzsh="code $HOME/.oh-my-zsh"
alias _zshconfig="code $HOME/.zshrc"

if command -v nvim >/dev/null; then
  alias vi=$(which nvim)
  alias vim=$(which nvim)
fi

_updateall() (
  _updatep10k
  _updatezshplugins
  _updatedelta
  _updateitermcolorschemes
)

_updatep10k() (
  git -C "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" pull
)

_updatezshplugins() (
  git -C "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" pull
  git -C "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" pull
)

_updatedelta() (
  git -C "$HOME/.delta" pull
)

_updateitermcolorschemes() (
  git -C "$HOME/.iterm2-color-schemes" pull
)