##
## ksh startup script
##

##
## Set the `traditional` prompt
##
HOST="$(hostname -s)"
PS1="$USER@$HOST"

case $(id -u) in
0)	PS1="${PS1}# " ;;
*)	PS1="${PS1}$ " ;;
esac

export HOST PS1

##
## Useful aliases
##

# listing
alias ls="ls -F --color=never"
alias la="ls -Fa --color=never"
alias ll="ls -Fl --color=never"

# short forms
alias E=vim
alias G='./gradlew'
alias V='vim -R'

# utilities
alias usbtty='picocom -b 115200 /dev/ttyUSB0'
alias breakspaces="tr '[:blank:]' '\n'"
alias igrep='grep -i'
alias dgrep='grep -nr'
alias pshrug="echo '¯\_(ツ)_/¯'"
alias avrmk='make -m /usr/home/flo/devel/avr-mk'

# local aliases
if [ "$(uname)" = FreeBSD ]
then
	alias openssl='/usr/local/bin/openssl'
elif [ "$(uname)" = Linux ]
then
	# FreeBSD commands
	alias exctags=ctags-exuberant
	alias gmake=/usr/bin/make

	# Linux crap fixes
	alias nc=nc.openbsd
fi

# Declare the truth
echo '“There are two ways to write error free programs, only the third one works.”'
