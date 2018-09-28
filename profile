# $FreeBSD: head/share/skel/dot.profile 320672 2017-07-05 13:08:07Z trasz $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

EDITOR=vim;   	export EDITOR
PAGER=less;  	export PAGER

# Read the profile files from $HOME/lib/profile.d
# most of them manipulate the environment, especially $PATH
if [ -d "$HOME/lib/pofile.d" ]
then
	for f in "$HOME/lib/profile.d"/*
	do
		. "$f"
	done
fi

# Set up local $PATH
if [ -d "$HOME/.local/bin" ]
then
	PATH="$HOME/.local/bin:$PATH"
fi
arch=`uname -m`
# Linux reports x86_64, FreeBSD reports amd64, use the latter
if [ "$arch" = x86_64 ]
then
	arch=amd64
fi
if [ -d "$HOME/bin" ]
then
	for b in py sh "$arch"
	do
		if [ -d "$HOME/bin/$b" ]
		then
			PATH="$HOME/bin/$b:$PATH"
		fi
	done
fi
# Modifications are done, so now the variables can be exported
export PATH

# set ENV to a file invoked each time sh is started for interactive use.
if [ -n "$KSH_VERSION" ]
then
	ENV="$HOME/.kshrc"
else
	ENV="$HOME/.shrc"
fi
export ENV

# if running bash (improbable, but possible)
# also, compatibility with Debian/Ubuntu
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

# for now, no display manager is used, so this works just fine
eval $(ssh-agent)
