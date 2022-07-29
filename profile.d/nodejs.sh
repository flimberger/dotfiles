case $HOST in
Stormbird)	# This is only used on my work machine
	NODE_HOME="$HOME/lib/nodejs"
	export PATH="$PATH:$NODE_HOME/bin"
	case $NODE_PATH in
	"")	export NODE_PATH="$NODE_HOME/lib/node_modules" ;;
	*)	export NODE_PATH="$NODE_HOME/lib/node_modules:$NODE_PATH" ;;
	esac
	;;
esac
