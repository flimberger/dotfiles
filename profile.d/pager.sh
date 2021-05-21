if command -v p >/dev/null; then
	export PAGER=p
	export MANPAGER=p
else
	command -v lesspipe >/dev/null && eval $(lesspipe)
	export LESS="-FQX"
	export PAGER=less
	export MANPAGER="less"
fi
