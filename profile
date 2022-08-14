EDITOR=nvim
command -v nvim >/dev/null || EDITOR=vi
export EDITOR

export LESS=-FQRXs
export MANPAGER=less
PAGER=p
command -v p >/dev/null || PAGER=less
export PAGER

export HOST="$(hostname -s)"

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
if [ -f "$HOME/lib/cfg/profile.$HOST" ]; then
	. "$HOME/lib/cfg/profile.$HOST"
fi

export PLAN9=/usr/local/plan9
case $(uname) in
FreeBSD)	NPROC=$(sysctl -n hw.ncpu) ;;
Linux)		NPROC=$(nproc) ;;
esac
PATH="$PATH:$PLAN9/bin"

export GOPATH="$HOME/devel/gocode"
PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

case "$HOST" in
Stormbird)
	export ANDROID_SDK_ROOT="$HOME/lib/android/sdk"
	# This variable is deprecated, but still used by gradle.
	export ANDROID_HOME="$ANDROID_SDK_ROOT"
	PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/build-tools/$(ls "$ANDROID_SDK_ROOT/build-tools | sort -n | tail -1)"
	export ANDROID_STUDIO_HOME="$HOME/lib/apps/android-studio"

	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	local node="$HOME/lib/nodejs"
	export NODE_PATH="$node/lib/node_modules"
	PATH="$PATH:$node/bin"

	PATH="$PATH:$HOME/lib/apps/STM32CubeProgrammer/bin"
	;;
esac

export CARGO_HOME="$HOME/lib/cargo"
export RUSTUP_HOME="$HOME/lib/rustup"
PATH="$CARGO_HOME/bin:$PATH"

# Modifications are done, so now the variables can be exported
export PATH

export LANG="en_GB.UTF-8"
export LC_ADDRESS="de_DE.UTF-8"
export LC_COLLATE="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_IDENTIFICATION="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_NAME="de_DE.UTF-8"
export LC_NUMERIC="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LC_TELEPHONE="de_DE.UTF-8"
export LC_TIME="en_IE.UTF-8" # Proper date formatting while retaining english names
unset LANGUAGE
unset LC_ALL

# Erlang setup: output strings as unicode per default, enable shell history
export ERL_FLAGS="+pc unicode -kernel shell_history enabled"

case $(uname) in
FreeBSD)	export JAVA_HOME=/usr/local/openjdk8 ;;
Linux)		export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 ;;
esac

export RIPGREP_CONFIG_PATH="$HOME/lib/cfg/ripgreprc"

export TMUX_SESSIONRC="$HOME/lib/cfg/tmux_sessionrc"
export TMUX_SESSION_HOME="$HOME/lib/cfg/tmux_session.d"

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
