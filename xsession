#!/bin/sh

startcwm(){
	xrdb -merge lib/cfg/Xresources
	test -f lib/cfg/$HOST.xresources && xrdb -merge lib/cfg/$HOST.xresources

	wp=pic/wp/simonstalenhag/wevegotbandwidth.jpg
	if [ -f "$wp" ]
	then	hsetroot -full "$wp"
	else	hsetroot -solid gray25
	fi

	9 stats -lmbW 80x72@0,0 &
	xclock -render -geometry 80x80+0+72 &

	# composite effects, improves firefox experience
	compton --backend=glx \
	    --no-fading-openclose \
	    --no-dock-shadow \
	    --no-dnd-shadow \
	    --shadow-opacity=0 \
	    --focus-exclude "\"class_g = 'Firefox'\"" \
	    --glx-no-stencil \
	    --daemon
	exec ssh-agent dbus-launch --exit-with-session cwm
}

startxfce(){
	exec ck-launch-session dbus-launch --exit-with-session startxfce4
}

. ./lib/cfg/profile

# disable bell
xset b off

# input config
case $(hostname -s) in
zodiacal)
	# For the thinkpad, the model is "thinkpad"
	# For the Model M, the model is "pc102"
	setxkbmap \
		-model pc102 \
		-layout us,de,ru \
		-option grp:alt_caps_toggle

	# disable touchpad
	touchpadctl -d

	tpid=$(xinput --list --name-only | grep TrackPoint | head -1)
	xinput set-prop "$tpid" "libinput Scroll Method Enabled" 0 0 0
	unset tpid

	# Plan 9 From User Space
	# On Ubuntu, these are controlled by a systemd user session
	9 plumber
	9 factotum
	9 fontsrv &
	;;
esac

session=cwm
case $session in
cwm)	startcwm ;;
xfce)	startxfce ;;
esac
