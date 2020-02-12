# Plan9port installation directory
export PLAN9=/usr/local/plan9
case $(uname) in
FreeBSD) NPROC=$(sysctl hw.ncpu) ;;
Linux) NPROC=$(nproc) ;;
esac
export NPROC
export PATH="$PATH:$PLAN9/bin"

export cputype="$(uname -m)"
export objtype="$cputype"
export user="$USER"
export home="$HOME"
