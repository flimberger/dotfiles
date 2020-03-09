ANDROID_SDK_ROOT="$HOME/lib/android/sdk"
# This is deprecated, but still used by gradle
ANDROID_HOME="$ANDROID_SDK_ROOT"
ANDROID_STUDIO_HOME="$HOME/lib/apps/android-studio"
PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/build-tools/$(ls "${ANDROID_SDK_ROOT}/build-tools" | sort -n | tail -1)"

export ANDROID_HOME ANDROID_SDK_ROOT ANDROID_STUDIO_HOME PATH

alias systrace="/usr/bin/env python $ANDROID_HOME/platform-tools/systrace/systrace.py"
