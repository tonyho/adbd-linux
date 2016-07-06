
targetSmpFlag := -DANDROID_SMP=1

commonSources := \
	errors_test.cpp \
	errors_unix.cpp \
	file.cpp \
	file_test.cpp \
	logging.cpp \
	logging_test.cpp \
	parseint_test.cpp \
	parsenetaddress.cpp \
	parsenetaddress_test.cpp \
	stringprintf.cpp \
	stringprintf_test.cpp \
	strings.cpp \
	strings_test.cpp \
	test_main.cpp \
	test_utils.cpp

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

