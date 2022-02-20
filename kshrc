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

test -f "$HOME/lib/cfg/aliases" && . "$HOME/lib/cfg/aliases"
test -f "$HOME/lib/cfg/ksh_completions" && . "$HOME/lib/cfg/ksh_completions"

export HISTFILE="$HOME/.ksh_history"
export HISTSIZE=5000

# Use emacs bindings instead of vi
set -o emacs

# Declare the truth
#echo '“There are two ways to write error free programs, only the third one works.”'
echo 'Das Leben ist zu kurz für schlechten Code.'
