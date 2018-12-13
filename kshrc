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

# Declare the truth
echo '“There are two ways to write error free programs, only the third one works.”'
