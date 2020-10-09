# vi: ft=sh

. .profile

xrdb -merge .Xresources

# For the thinkpad, the model is "thinkpad"
# For the Model M, the model is "pc102"
setxkbmap \
    -model pc102 \
    -layout us,de,ru \
    -option grp:alt_caps_toggle

# TODO: at least the 9 should be queried somehow...
xinput set-prop 9 "libinput Scroll Method Enabled" 0 0 0

# Plan 9 From User Space
9 plumber &
9 fontsrv &
9 stats -lmb &

# composite effects, improve firefox experience
compton --backend=glx \
    --no-fading-openclose \
    --no-dock-shadow \
    --no-dnd-shadow \
    --shadow-opacity=0 \
    --menu-opacity=1 \
    --frame-opacity=1 \
    --glx-no-stencil \
    --daemon
hsetroot -solid 'steel blue'

exec ssh-agent dbus-launch cwm
