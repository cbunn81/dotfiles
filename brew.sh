#!/usr/bin/env bash

# Install Homebrew, which will prompt to install command-line tools if missing.
# Instead, use Strap: https://strap.mikemcquaid.com/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

# Install my formulae and casks - cbunn
brew bundle --global

# Remove outdated versions from the cellar.
brew cleanup
