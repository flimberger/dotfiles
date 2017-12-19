HOST="$(hostname -s)"
PS1="${USER}@${HOST}"

case $(id -u) in
0)	PS1="${PS1}# " ;;
*)	PS1="${PS1}$ " ;;
esac

export HOST PS1

# General aliases

# listing
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'

# short forms
alias e=vim
alias g='./gradlew'
alias v='vim -R'

# utilities
alias usbtty='picocom -b 115200 /dev/ttyUSB0'
alias breakspaces="tr '[:blank:]' '\n'"
alias igrep='grep -i'
alias dgrep='grep -nr'

# FreeBSD commands
alias exctags=ctags-exuberant
alias gmake=/usr/bin/make

# Linux crap fixes
alias nc=nc.openbsd
