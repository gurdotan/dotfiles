#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Add cask
brew tap caskroom/cask

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Leave only necessary stuff from Mathias' brew list
brew install binutils
brew install ack
brew install dark-mode
brew install git
brew install imagemagick --with-webp
brew install pv
brew install rename
brew install tree
brew install zopfli

# Gur: install more utilities
brew install jq          			# Add the jq tool for command line JSON parsing
brew install pstree      			# Add the pstree tool for showing a process tree
brew install multitail   			# CLI utility for tailing multiple files at once
brew install entr        			# Like watch
brew install sshrc       			# Bring your shell to SSH sessions
brew install ssh-copy-id 			# Copy public keys directly to remote machines' authorized keys
brew install fzf         			# Fuzzy file finding: https://github.com/junegunn/fzf
brew install diff-so-fancy		# Better git diffs: https://github.com/so-fancy/diff-so-fancy
brew install ripgrep					# grep on steroids: https://github.com/BurntSushi/ripgrep
brew install bat							# A cat(1) clone with wings.  https://github.com/sharkdp/bat
brew install prettyping       # An alternative to ping: https://github.com/denilsonsa/prettyping
brew install tldr             # Community driven man pages: https://github.com/tldr-pages/tldr
brew install fd               # A simple, fast and user-friendly alternative to 'find': https://github.com/sharkdp/fd

# Gur: install dev environment
# brew install mongodb
# brew install redis
# brew install mysql
# brew install awscli
# brew install posgresql
# brew install jenv
# brew install maven



# Gur: install OSX applications with Brew Cask
#
# brew cask install google-chrome
# brew cask install firefox
# brew cask install google-drive
# brew cask install flux
# brew cask install iterm2
# brew cask install slack
# brew cask install skitch
# brew cask install atom
# brew cask install spectacle
# brew cask install spotify
# brew cask install whatsapp
# brew cask install skype
# brew cask install tunnelblick
# brew cask install git-extras

# Gur: Development tools
#
# brew cask install java
# brew cask install android-sdk
# brew cask install dbeaver-community
# brew cask install docker
# brew cask install kitematic
# brew cask install sourcetree
# brew cask install fiddler
# brew cask install intellij-idea

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
