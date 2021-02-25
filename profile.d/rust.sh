export CARGO_HOME="$HOME/lib/cargo"
export RUSTUP_HOME="$HOME/lib/rustup"
# The bin path is exported by $CARGO_HOME/env
if [ -f "$CARGO_HOME/env" ]; then
	. "$CARGO_HOME/env"
fi
