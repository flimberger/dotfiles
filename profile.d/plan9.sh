# Plan9port installation directory
export PLAN9=/usr/local/plan9

case $(uname) in
FreeBSD) NPROC=$(sysctl -n hw.ncpu) ;;
Linux) NPROC=$(nproc) ;;
esac
export NPROC
export PATH="$PATH:$PLAN9/bin"
