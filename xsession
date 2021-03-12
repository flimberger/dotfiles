#!/bin/sh

. .profile

xrdb -merge .Xresources

# For the thinkpad, the model is "thinkpad"
# For the Model M, the model is "pc102"
setxkbmap \
    -model pc102 \
    -layout us,de,ru \
    -option grp:alt_caps_toggle

tpid=$(xinput --list --name-only | grep TrackPoint | head -1)
xinput set-prop "$tpid" "libinput Scroll Method Enabled" 0 0 0

# Plan 9 From User Space
9 plumber
9 factotum
9 fontsrv &

wm=cwm

case "$wm" in
cwm)
	9 stats -lmbW 80x72@0,0 &

	# composite effects, improves firefox experience
	compton --backend=glx \
	    --no-fading-openclose \
	    --no-dock-shadow \
	    --no-dnd-shadow \
	    --shadow-opacity=0 \
	    --menu-opacity=1 \
	    --frame-opacity=1 \
	    --glx-no-stencil \
	    --daemon
	#hsetroot -solid 'steel blue'
	hsetroot -solid '#262626'
	exec ssh-agent dbus-launch --exit-with-session cwm
	;;
xfce)
	# copied from /usr/local/etc/xdg/xfce4/xinitrc
	export DESKTOP_SESSION=xfce
	export XDG_CURRENT_DESKTOP=XFCE

	if command -v xdg-user-dirs-update >/dev/null 2>&1; then
		xdg-user-dirs-update
	fi

	case $(uname) in
	FreeBSD)
		# On FreeBSD, XDM doesn't use consolekit
		exec ck-launch-session xfce4-session
		;;
	Linux)
		# On Linux, the display manager already uses consolekit
		exec xfce4-session
		;;
	esac
	;;
esac
