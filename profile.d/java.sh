case $(uname) in
FreeBSD)
	export JAVA_HOME=/usr/local/openjdk8
	;;
Linux)
	# Older gradle versions do not support Java 10
	# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
	export JAVA_HOME="$HOME/lib/apps/android-studio/jre"
esac
