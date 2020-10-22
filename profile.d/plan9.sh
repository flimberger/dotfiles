# Plan9port installation directory
export PLAN9=/usr/local/plan9
case $(uname) in
FreeBSD) NPROC=$(sysctl -n hw.ncpu) ;;
Linux) NPROC=$(nproc) ;;
esac
export NPROC
export PATH="$PATH:$PLAN9/bin"

# Use uppercase variable names as customary on Unix.
export SYSNAME=$(hostname -s)
export CPUTYPE=$(uname -m)
export OBJTYPE="$CPUTYPE"
