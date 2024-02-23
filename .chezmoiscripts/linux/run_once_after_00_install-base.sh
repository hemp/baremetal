#!/bin/bash

echo '---'
echo 'Distribution:'
uname -a
echo '---'
sudo apt-get update

# install http://brew.sh/ and bundle

if ! command -v brew >/dev/null; then
  sudo apt-get install -y build-essential procps curl file git
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  brew analytics off
  brew tap homebrew/bundle
  brew update
  brew cleanup
fi

# apt for stable base of tools and services (debian stable)
# brew for user packages and ease of installation (debian unstable / newer)

# 2024-04-02: `neovim` example

# ❯ apt info neovim
# Package: neovim
# Version: 0.7.2-7
# Priority: optional
# Section: editors
# Maintainer: Debian Vim Maintainers <team+vim@tracker.debian.org>
# Installed-Size: 4792 kB
# Provides: editor
# Depends: neovim-runtime (= 0.7.2-7), libc6 (>= 2.34), libluajit-5.1-2 (>= 2.0.4+dfsg) | libluajit2-5.1-2 (>= 2.1~), libmsgpackc2 (>= 2.1.0), libtermkey1 (>= 0.19), libtree-sitter0 (>= 0.20.2), libunibilium4 (>= 2.0), libuv1 (>= 1.30.1), libvterm0 (>= 0.1), lua-luv (>= 1.44.2-0)
# Recommends: python3-pynvim, xclip | xsel | wl-clipboard, xxd
# Suggests: ctags, vim-scripts
# Homepage: https://neovim.io/
# Download-Size: 1779 kB
# APT-Sources: http://deb.debian.org/debian bookworm/main amd64 Packages
# Description: heavily refactored vim fork

# ❯ brew info neovim
# ==> neovim: stable 0.9.5 (bottled), HEAD
# Ambitious Vim-fork focused on extensibility and agility
# https://neovim.io/
# /home/linuxbrew/.linuxbrew/Cellar/neovim/0.9.5 (1,738 files, 28MB) *
#   Poured from bottle using the formulae.brew.sh API on 2024-04-02 at 14:22:54
# From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/n/neovim.rb
# License: Apache-2.0
# ==> Dependencies
# Build: luarocks ✘, cmake ✘, lpeg ✘, unzip ✘
# Required: gettext ✔, libtermkey ✔, libuv ✔, libvterm ✔, luajit ✔, luv ✔, msgpack ✔, tree-sitter ✔, unibilium ✔, libnsl ✔, gcc ✔
# ==> Options
# --HEAD
#  Install HEAD version
# ==> Analytics
# install: 25,678 (30 days), 100,850 (90 days), 357,430 (365 days)
# install-on-request: 25,466 (30 days), 100,010 (90 days), 354,734 (365 days)
# build-error: 1,208 (30 days)