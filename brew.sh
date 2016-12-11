#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Add cask
brew tap caskroom/cask

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
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
# brew cask install iterm2
# brew cask install slack
# brew cask install skitch
# brew cask install atom
# brew cask install spectacle
# brew cask install docker
# brew cask install spotify
# brew cask install whatsapp
# brew cask install java
# brew cask install skype
# brew cask install tunnelblick
# brew cask install git-extras


# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
