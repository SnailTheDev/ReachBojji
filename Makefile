THEOS_DEVICE_IP = 192.168.99.102
THEOS_DEVICE_PORT = 22

DEBUG = 0

ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:14.3:10.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ReachBojji
$(TWEAK_NAME)_FILES = Tweak.xm BojjiView.m
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

