# installation directory
goroot="/usr/local/go"
# directory containing the code
godevel="$HOME/devel/gocode"

# Variable for the tools; may have multiple entries
export GOPATH="$godevel"

# Use the code path variable, as GOPATH may contain multiple entries
export PATH="$goroot/bin:$GOPATH/bin:$PATH"
