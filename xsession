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
9 stats -lmbW 80x72@0,0 &

xclock -render -geometry 80x80+0+72 &

hsetroot -solid '#262626'

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

exec ssh-agent dbus-launch --exit-with-session cwm
