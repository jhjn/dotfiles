set -o vi

#====================== EXPORTS =====================================
export PS1='\[\e[0;49;33m\]\w\[\e[1;49;34m\]$ \[\e[0m\]'
export EDITOR=vim
export HISTFILESIZE=10000
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '\!{.git,node_modules,Library}/*' 2> /dev/null"
#export RESTIC_REPOSITORY='sftp:rpi:/srv/restic-repo'
export RESTIC_REPOSITORY='sftp:zero:/home/jhjn/restic-bkp'
export FFF_FAV1=~
export FFF_FAV2=~/Sync/phys/III/project
export FFF_FAV3=~/Documents
export FFF_FAV4=Sync
export FFF_FAV5=~/.bashrc
export FFF_FAV6=~/.vimrc
export FFF_FAV7=~/.skhdrc
export FFF_FAV8=
export FFF_FAV9=

#========================== ALIASES =================================
alias ..='cd ..'
alias ...='cd ../..'
alias t="task"
alias ts="task sync"
alias ytdl="youtube-dl"
alias ls="ls -FG"
alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gcam="git commit -am"
alias cfg='/usr/bin/git --git-dir=$HOME/.config/.dotfiles/ --work-tree=$HOME'
alias bashrc="bat ~/.bashrc"

#======================== FUNCTIONS =================================
# Get current news headlines from bbc news
bbc () {
	curl -s http://feeds.bbci.co.uk/news/rss.xml | grep "<title>" | sed "s/            <title><\!\[CDATA\[//g;s/\]\]><\/title>//;" | grep -v "BBC News" | head
}

# Opens fff browser and cds to current directory when exiting
f() { # general browse
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# Open a file in Vim after traversing ~ using fzf
ff() {
	clear
	local ff_file=$(rg --files --no-ignore --hidden -g '!{.git,node_modules,Library,Pictures,.Trash,Movies,Music}/*' 2> /dev/null | fzf --preview "bat --plain --color always {}" --reverse )
	[ -n "$ff_file" ] && cd "$(dirname "$ff_file" )" && vim "${ff_file##*/}"
}

# Pretty output of the last $1 commits, defaults to 1
gl () {
	re='^[0-9]+$'
	[[ "$@" =~ $re ]] && git log -"$@" --pretty="%Cred%h %Cgreen%ar %Cblue%B%Creset" || git log -1 --pretty="%Cred%h %Cgreen%ar %Cblue%B%Creset"&& return
}

# Prettily outputs the size of each folder in PWD
lsl () { 
	du -sh * | sort -h | awk '{ print "\033[1;31m"$1"\t""\033[1;34m"$2"\033[0m " }' | column -t; 
}

# Open the fuzzy found PDF from physics folder in preview
notes () { 
	open -a Preview $(find ~/Sync/phys/III | grep .pdf | sed 's/\/Users\/joejenne\/Sync\/phys\/III\///' | fzf --height 60% --reverse | sed 's/^/\/Users\/joejenne\/Sync\/phys\/III\//') 
}

# Free online radio with a bunch of different vibes
somafm() {
	local station
	echo "Select a station to listen to:";select station in "Groove Salad - ambient" "Drone Zone - minimal" "Indie Pop - pop" "Space Station - slow electronica" "Secret Agent - drama" "Lush - mellow vocals" "U 80s - synthpop" "Seventies - album rock" "GS Classic - '00s ambient" "Deep Space One - experimental" "DEF CON - edm" "Folk Fwd - alt-folk" "The Trip - prog house/trance" "Bagel - alt rock" "Beat Blender - deep house" "Boot Liquor - country" "Suburbs of Goa - asian" "PopTron - indie dance" "Sonic Universe - e. jazz" "Thistle - celtic" "Fluid - instr. hiphop" "7 Soul - vintage" "Cliq Hop - idm" "Ill Street - exotica" "Digitalis - analog rock" "Mission Control - space" "Dubstep - deep bass" "Covers - all" "Metal - all" "SF 10 33 - ambient traffic" "BR FM - burning man" "Live - event" "Specials - event"
	do station=$(echo -n "$station"|tr '[:upper:]' '[:lower:]'|awk -F"-" '{ print $1}' |sed 's/ //g');break;done;mpv http://somafm.com/startstream=${station}.pls
}

# Open twitch stream for $1 in mpv
twitch () {
	iina "http://twitch.tv/$1"
}

0x0 () {
	if [ -z "$@" ]; then
		echo "Specify a file" && return
	fi
	curl -F "file=@$@" 0x0.st
}



source ~/.config/commacd.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
