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

if [ -f "$HOME/.aliases" ]; then
	source "$HOME/.aliases"
fi

export HISTFILE="$HOME/.ksh_history"
export HISTSIZE=2000

echo 'Das Leben ist zu kurz für schlechten Code.'
