ANDROID_SDK_ROOT="/opt/google/android-sdk"
# This is deprecated, by still used by gradle
ANDROID_HOME="$ANDROID_SDK_ROOT"
ANDROID_STUDIO_HOME="/opt/google/android-studio"
PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/build-tools/$(ls "${ANDROID_SDK_ROOT}/build-tools" | sort -n | tail -1)"

export ANDROID_HOME ANDROID_SDK_ROOT ANDROID_STUDIO_HOME PATH

alias systrace="/usr/bin/env python $ANDROID_HOME/platform-tools/systrace/systrace.py"
