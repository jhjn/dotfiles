#!/usr/bin/env bash

PACKAGES=(
	bat
	ddgr
	ffmpeg
	fzf
	git
	gnupg
	imagemagick
	mpv
	netcat
	pandoc
	pass
	python
	python3
	ranger
	restic
	ripgrep
	skhd
	streamlink
	syncthing
	taskwarrior
	tmux
	vim
	wget
	yabai
	youtube-dl
)

CASKS=(
	eloston-chromium
	gimp
	inkscape
	iterm2
	karabiner-elements
)

function prompt {
	read -p "Hit Enter to $1 ..."
}
prompt "begin"

if test ! $(which brew); then
	xcode-select --install

    prompt "install Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	prompt "update Homebrew"
	brew update
	brew upgrade
fi

brew doctor

function install {
	cmd=$1
	shift 
	for pkg in $@;
	do
		exec="$cmd $pkg"
		prompt "Execute: $exec"
		if ${exec} ; then
			echo "Installed $pkg"
		else
			echo "Failed to execute: $exec"
		fi
	done
}

#necessary taps
brew tap koekeishiya/formulae
brew tap cjbassi/gotop
prompt "install packages"
brew info ${PACKAGES[@]}
#install 'brew install' ${PACKAGES[@]}

prompt "install software"
brew cask info ${CASKS[@]}
#install 'brew cask install' ${CASKS[@]}

prompt "cleanup"
brew cleanup
brew cask cleanup



echo "ALL DONE!"
