# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_BUILD_PDK), true)

# Make the JNI part
# ============================================================
include $(CLEAR_VARS)

LOCAL_CFLAGS += -Wall -Werror -Wextra -Wno-unused-parameter -Wno-unused-function \
                -Wunused-variable -Winit-self -Wwrite-strings -Wshadow

LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE) \

LOCAL_SHARED_LIBRARIES += \
	liblog \
	libnativehelper \
	libcutils \
	libutils \
	libdl

LOCAL_SRC_FILES := \
	jni/com_android_server_wifi_WifiNative.cpp \
	jni/jni_helper.cpp

LOCAL_MODULE := libwifi-service

include $(BUILD_SHARED_LIBRARY)

endif  # !TARGET_BUILD_PDK
