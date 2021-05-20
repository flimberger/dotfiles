ANDROID_SDK_ROOT="$HOME/lib/android/sdk"
if [ -d "$ANDROID_SDK_ROOT" ]; then
	export ANDROID_SDK_ROOT
	# This variable is deprecated, but still used by gradle.
	export ANDROID_HOME="$ANDROID_SDK_ROOT"
	export PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/build-tools/$(ls "${ANDROID_SDK_ROOT}/build-tools" | sort -n | tail -1)"

	alias systrace="/usr/bin/env python $ANDROID_SDK_ROOT/platform-tools/systrace/systrace.py"

	ANDROID_STUDIO_HOME="$HOME/lib/apps/android-studio"
	if [ -d "$ANDROID_STUDIO_HOME" ]; then
		export ANDROID_STUDIO_HOME
	else
		unset ANDROID_STUDIO_HOME
	fi
else
	unset ANDROID_SDK_ROOT
fi
