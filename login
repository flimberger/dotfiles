setenv	HOST	`uname -s`

setenv	EDITOR	ed
setenv	VISUAL	vi
setenv	PAGER	less
setenv	LESS	-FQRXs

test -d "/local/bin"		&& setenv PATH	"/local/bin:$PATH"
test -d "$HOME/.local/bin"	&& setenv PATH	"$HOME/.local/bin:$PATH"
test -d "$HOME/bin/scripts"	&& setenv PATH	"$HOME/bin/scripts:$PATH"
test -d "$HOME/bin/amd64"	&& setenv PATH	"$HOME/bin/amd64:$PATH"

setenv	CARGO_HOME	$HOME/lib/cargo
setenv	RUSTUP_HOME	$HOME/lib/rustup
setenv	PATH		$CARGO_HOME/bin:$PATH
setenv	RIPGREP_CONFIG_PATH	$HOME/lib/cfg/ripgreprc
setenv	TMUX_SESSIONRC	$HOME/lib/cfg/tmux_sessionrc
setenv	TMUX_SESSION_HOME	$HOME/lib/cfg/tmux_session.d
setenv	PLAN9		/usr/local/plan9
setenv	GOPATH		$HOME/devel/gocode
setenv	PATH		/usr/local/go/bin:$GOPATH/bin:$PATH

setenv	ERL_FLAGS	"+pc unicode -kernel shell_history enabled"

# Query terminal size; useful for serial lines.
if ( -x /usr/bin/resizewin ) /usr/bin/resizewin -z

# Display a random cookie on each login.
if ( -x /usr/bin/fortune ) /usr/bin/fortune freebsd-tips
