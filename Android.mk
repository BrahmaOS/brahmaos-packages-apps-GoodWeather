LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := GoodWeather
LOCAL_MODULE_TAGS := optional
LOCAL_DEX_PREOPT := false

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PROGUARD_FLAG_FILES := ../../../frameworks/support/design/proguard-rules.pro


ifeq ($(TARGET_BUILD_APPS),)
support_library_root_dir := frameworks/support
else
support_library_root_dir := prebuilts/sdk/current/support
endif

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
                      $(support_library_root_dir)/design/res \
		      $(support_library_root_dir)/v7/cardview/res \
		      $(support_library_root_dir)/v7/recyclerview/res \
                      $(support_library_root_dir)/v7/appcompat/res

LOCAL_AAPT_FLAGS := \
    --auto-add-overlay \
    --extra-packages android.support.design \
    --extra-packages android.support.v7.cardview \
    --extra-packages android.support.constraint \
    --extra-packages android.support.v7.recyclerview \
    --extra-packages android.support.v7.appcompat


LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-design \
    android-support-v7-recyclerview \
    android-support-v4 \
    android-support-v7-cardview \
    android-support-v7-appcompat \
    constraint-layout-solver \
    MPAndroidChart \
    gson

LOCAL_STATIC_JAVA_AAR_LIBRARIES := \
               constraint-layout


include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
               MPAndroidChart:libs/MPAndroidChart-v3.0.0-beta1.jar \
	       constraint-layout:libs/constraint-layout-1.0.2.aar \
	       constraint-layout-solver:libs/constraint-layout-solver-1.0.2.jar \
               gson:libs/gson-2.6.2.jar

include $(BUILD_MULTI_PREBUILT)

