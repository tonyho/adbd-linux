
targetSmpFlag := -DANDROID_SMP=1

commonSources := \
	errors_unix.cpp \
	file.cpp \
	logging.cpp \
	parsenetaddress.cpp \
	stringprintf.cpp \
	strings.cpp

# Shared and static library for target
# ========================================================
LOCAL_MODULE := libbase.a
LOCAL_SRC_FILES := $(commonSources) \
#	ashmem-dev.c \
	mq.c \
	android_reboot.c \
	partition_utils.c \
	uevent.c \
	qtaguid.c \
	klog.c
# LOCAL_SRC_FILES += memory.c

LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_STATIC_LIBRARIES := liblog
LOCAL_CFLAGS += $(targetSmpFlag)

################################

OBJS = $(LOCAL_SRC_FILES:.cpp=.o)
CFLAGS = -std=c++0x $(LOCAL_CFLAGS) -I../include/ -Iinclude/ -I. -DHAVE_PTHREADS=1 -DADB_NON_ANDROID=1
CFLAGS += -DPROP_NAME_MAX=32 -DPROP_VALUE_MAX=92

all: $(LOCAL_MODULE)

%.o: %.cpp
	g++ -g -c -fPIC $(CFLAGS) $(LFLAGS) $< -o $@

$(LOCAL_MODULE): $(OBJS)
	ar rcs $@ $?
	ranlib $@

clean:
	rm -f $(LOCAL_MODULE) *.o

