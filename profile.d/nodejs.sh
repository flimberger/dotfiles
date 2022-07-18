if [ x"$HOST" = xStormbird ]  # This is only used on my work machine
then	NODE_HOME="$HOME/lib/nodejs"
	export PATH="$PATH:$NODE_HOME/bin"
	export NODE_PATH="$NODE_HOME/lib/node_modules:$NODE_PATH"
fi
