export PS1='\u@\h\$ '

test -f "$HOME/lib/cfg/aliases" && . "$HOME/lib/cfg/aliases"
test -f "$HOME/lib/cfg/ksh_completions" && . "$HOME/lib/cfg/ksh_completions"

export HISTFILE="$HOME/.ksh_history"
export HISTSIZE=5000

# Use emacs bindings instead of vi
set -o emacs

# Add pushd/popd/dirs
function pushd {
	local len=${#_KSH_DIRSTACK[@]}
	_KSH_DIRSTACK[len]=$PWD
	cd "$1"
}
function popd {
	local len=${#_KSH_DIRSTACK[@]}
	if [[ $len -gt 0 ]]
	then	local d=${_KSH_DIRSTACK[len - 1]}
		unset _KSH_DIRSTACK[$((len - 1))]
		cd "$d"
	fi
}
function dirs {
	for i in $(seq 0 $((${#_KSH_DIRSTACK[@]} - 1)))
	do	echo "$i: ${_KSH_DIRSTACK[$i]}"
	done
}

# Declare the truth
#echo '“There are two ways to write error free programs, only the third one works.”'
echo 'Das Leben ist zu kurz für schlechten Code.'
