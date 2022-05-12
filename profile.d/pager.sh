command -v lesspipe >/dev/null && eval $(lesspipe)
export LESS=-FQRXs
export MANPAGER=less

if command -v p >/dev/null; then
	export PAGER=p
else
	export PAGER=less
fi
