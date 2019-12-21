set -o vi

export PS1='\[\e[0;49;33m\]\w\[\e[1;49;34m\]$ \[\e[0m\]'
export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --preview "bat {}" --no-ignore --hidden --follow -g "!{.git,node_modules,Library}/*" 2> /dev/null'
#export RESTIC_REPOSITORY='sftp:rpi:/srv/restic-repo'
export RESTIC_REPOSITORY='sftp:zero:/home/jhjn/restic-bkp'

# ALIASES 
alias ..='cd ..'
alias ...='cd ../..'
alias t="task"
alias ts="task sync"
alias ytdl="youtube-dl"
alias iina="open -a iina"
alias ic="cd /Users/joejenne/Library/Mobile\ Documents/com~apple~CloudDocs && ls"
alias f="fff"
alias ls="ls -FG"
## GIT
alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gcam="git commit -am"
gl () {
	re='^[0-9]+$'
	[[ "$@" =~ $re ]] && git log -"$@" --pretty="%Cred%h %Cgreen%ar %Cblue%B%Creset" || git log -1 --pretty="%Cred%h %Cgreen%ar %Cblue%B%Creset"&& return
}
alias glog="git log --graph --oneline"
alias cfg='/usr/bin/git --git-dir=$HOME/.config/.dotfiles/ --work-tree=$HOME'
alias bashrc="bat ~/.bashrc"

# FUNCTIONS
function tmp {
  cd $(mktemp -d /tmp/$1.XXXX)
}

lsl () { du -sh * | sort -h | awk '{ print "\033[1;31m"$1"\t""\033[1;34m"$2"\033[0m " }' | column -t; }

notes () { 
	open -a Preview $(find ~/Sync/phys/III | grep .pdf | sed 's/\/Users\/joejenne\/Sync\/phys\/III\///' | fzf --height 60% --reverse | sed 's/^/\/Users\/joejenne\/Sync\/phys\/III\//') 
}

twitch () {
	streamlink --player "mpv -" "http://twitch.tv/$@" best
}

tan () {
	task $@ info | grep Annotation | awk -F\' '{print $2}'
}

0x0 () {
	if [ -z "$@" ]; then
		echo "Specify a file" && return
	fi
	curl -F "file=@$@" 0x0.st
}

cdd() {
	cd $(find ~ -type d | grep -vs "Library" | fzf)
}

mdeep () {
	file=$@
	filename="${file%.*}"
	cat ~/.scripts/markdeep.txt >> $@
	mv "$@" "$filename.md.html"
}

function bbc () {
	curl -s http://feeds.bbci.co.uk/news/rss.xml | grep "<title>" | sed "s/            <title><\!\[CDATA\[//g;s/\]\]><\/title>//;" | grep -v "BBC News" | head
}

# FFF customisation
export FFF_FAV1=~
export FFF_FAV2=~/Documents
export FFF_FAV3=/Users/joejenne/Library/Mobile\ Documents/com~apple~CloudDocs/Cambridge/II
export FFF_FAV4=Sync
export FFF_FAV5=~/.bashrc
export FFF_FAV6=~/.vimrc
export FFF_FAV7=~/.skhdrc
export FFF_FAV8=
export FFF_FAV9=

# FUNCTIONS #

somafm() {
	local station
	echo "Select a station to listen to:";select station in "Groove Salad - ambient" "Drone Zone - minimal" "Indie Pop - pop" "Space Station - slow electronica" "Secret Agent - drama" "Lush - mellow vocals" "U 80s - synthpop" "Seventies - album rock" "GS Classic - '00s ambient" "Deep Space One - experimental" "DEF CON - edm" "Folk Fwd - alt-folk" "The Trip - prog house/trance" "Bagel - alt rock" "Beat Blender - deep house" "Boot Liquor - country" "Suburbs of Goa - asian" "PopTron - indie dance" "Sonic Universe - e. jazz" "Thistle - celtic" "Fluid - instr. hiphop" "7 Soul - vintage" "Cliq Hop - idm" "Ill Street - exotica" "Digitalis - analog rock" "Mission Control - space" "Dubstep - deep bass" "Covers - all" "Metal - all" "SF 10 33 - ambient traffic" "BR FM - burning man" "Live - event" "Specials - event"
	do station=$(echo -n "$station"|tr '[:upper:]' '[:lower:]'|awk -F"-" '{ print $1}' |sed 's/ //g');break;done;mpv http://somafm.com/startstream=${station}.pls
}

ix() {
	curl=$(command -v curl)
	[ -f "$HOME/.netrc" ] && curl="${curl} --netrc"

	while getopts ":d:i:n:e:" opt; do
		case "${opt}" in
			d) ${curl} --request DELETE "ix.io/${OPTARG}"; return;;
			i) curl="${curl} --request PUT"; id="${OPTARG}";;
			n) curl="${curl} --form read:1=${OPTARG}";;
			e) curl="${curl} --form ext:1=${OPTARG}";;
			:) error "Expected argument: -${OPTARG}"; return 1;;
			*) echo 'Usage: ix [-d ID] [-i ID] [-n N] [<options>]';
				return;;
		esac
	done
	shift $((OPTIND - 1))
	unset -v OPTIND OPTERR

	if [ -t 0 ]; then
		filename="$1"; shift
		if [ "$filename" ]; then
			${curl} --form f:1=@"$filename" "${@}" "ix.io/${id}"
			return
		fi
		echo "^C to cancel, ^D to send."
	fi

	${curl} --form f:1='<-' "${@}" "ix.io/${id}"

	unset -v curl opt id filename
}

source ~/.config/commacd.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
