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

EDITOR=nvim
command -v nvim >/dev/null || EDITOR=vi
export EDITOR

# Set up local $PATH
if [ -d "$HOME/.local/bin" ]
then	PATH="$HOME/.local/bin:$PATH"
fi
if [ -d /local/bin ]
then	PATH="/local/bin:$PATH"
fi

cputype=$(uname -m)
# Linux reports x86_64, FreeBSD reports amd64, use the latter
case "$cputype" in
x86_64) cputype=amd64 ;;
aarch64) cputype=arm64 ;;
esac
if [ -d "$HOME/bin" ]; then
	for b in scripts "$cputype"; do
		if [ -d "$HOME/bin/$b" ]; then
			PATH="$HOME/bin/$b:$PATH"
		fi
	done
fi
# Add machine-local PATH
PATH="/local/bin:$PATH"
# Read the profile files from $HOME/lib/profile.d
# most of them manipulate the environment, especially $PATH
profile="$HOME/lib/profile.d"
if [ -d "$profile" ]; then
	for f in $(ls "$profile" | grep '\.sh$'); do
		. "$profile/$f"
	done
fi
unset profile

# Include machine-specific configuration
sysname=$(hostname -s)
if [ -f "$HOME/lib/cfg/profile.$sysname" ]; then
	. "$HOME/lib/cfg/profile.$sysname"
fi
unset sysname

# Modifications are done, so now the variables can be exported
export PATH
# set ENV to a file invoked each time sh is started for interactive use.
export ENV="$HOME/.kshrc"

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
