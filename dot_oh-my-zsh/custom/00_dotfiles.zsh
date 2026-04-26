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

# Disable Telemetry
# "universal" signals (honored by some, ignored by many)
export DISABLE_TELEMETRY=1
export DO_NOT_TRACK=1
export NO_TELEMETRY=1

# Tools that need their own specific var
export ASTRO_TELEMETRY_DISABLED=1          # Astro
export CDK_DISABLE_CLI_TELEMETRY=true      # AWS
export CHECKPOINT_DISABLE=1                # Prisma
export DOTNET_CLI_TELEMETRY_OPTOUT=1       # .NET CLI
export EXPO_NO_TELEMETRY=1                 # Expo
export GATSBY_TELEMETRY_DISABLED=1         # Gatsby
export GEMINI_TELEMETRY_ENABLED=false      # Gemini CLI
export GH_TELEMETRY=false                  # GitHub CLI
export HOMEBREW_NO_ANALYTICS=1             # Homebrew
export NEXT_TELEMETRY_DISABLED=1           # Next.js
export NUXT_TELEMETRY_DISABLED=1           # Nuxt
export SAM_CLI_TELEMETRY=0                 # AWS
export STORYBOOK_DISABLE_TELEMETRY=1       # Storybook
export VERCEL_PLUGIN_TELEMETRY=off         # Vercel
export VSCODE_CRASH_REPORTER_DISABLE=1     # VS Code
export VSCODE_TELEMETRY_DISABLE=1          # VS Code
export WRANGLER_SEND_METRICS=false         # Cloudflare Wrangler

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

command -v brew >/dev/null || export PATH="/opt/homebrew/bin:/home/linuxbrew/.linuxbrew/bin:/usr/local/bin"
command -v brew >/dev/null && eval "$(brew shellenv)"
eval "$(mise activate zsh)"
