# Older gradle versions do not support Java 10
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME="/opt/google/android-studio/jre"

# These were scrips before, now consolidated into $HOME/bin/sh/java_wrapper
alias java7='java_wrapper -v 7'
alias java8='java_wrapper -v 8'
alias java11='java_wrapper -v 11'
