# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# ksh setup
ENV="${HOME}/.kshrc"
export ENV

if [ -d "${HOME}/lib/profile.d" ]
then
	for l in "${HOME}/lib/profile.d/"*.sh
	do
		if [ -x "${l}" ]
		then
			. "${l}"
		fi
	done
fi

# set up path

if [ -d "${HOME}/.local/bin" ]
then
	PATH="${HOME}/.local/bin:${PATH}"
fi
# set PATH so it includes user's private bin if it exists
for a in py sh x86 amd64
do
	if [ -d "${HOME}/bin/${a}" ]
	then
		PATH="${HOME}/bin/${a}:${PATH}"
	fi
done
export PATH

eval $(ssh-agent)
