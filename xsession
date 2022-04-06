#!/bin/sh

. .profile

xrdb -merge lib/cfg/Xresources

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
	;;
esac

# Plan 9 From User Space
9 plumber
9 factotum
9 fontsrv &
9 stats -lmbW 80x72@0,0 &

xclock -render -geometry 80x80+0+72 &

wp=pic/wp/simonstalenhag/wevegotbandwidth.jpg
if [ -f "$wp" ]
then	hsetroot -full "$wp"
else	hsetroot -solid gray25
fi

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
