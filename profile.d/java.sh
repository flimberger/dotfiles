case $(uname) in
FreeBSD)
	JAVA_HOME=/usr/local/openjdk8
	;;
Linux)
	JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
esac
export JAVA_HOME
