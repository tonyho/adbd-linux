LOCAL_SRC_FILES = android_pubkey.c
LOCAL_MODULE = libcrypto_utils.a

################################

OBJS = $(LOCAL_SRC_FILES:.c=.o)
CFLAGS = $(LOCAL_CFLAGS) -I../include/ -Iinclude/ -I. -DHAVE_PTHREADS=1 -DADB_NON_ANDROID=1
CFLAGS += -DPROP_NAME_MAX=32 -DPROP_VALUE_MAX=92

all: $(LOCAL_MODULE)

%.o: %.c
	gcc -g -c -fPIC $(CFLAGS) $(LFLAGS) $< -o $@

$(LOCAL_MODULE): $(OBJS)
	ar rcs $@ $?
	ranlib $@

clean:
	rm -f $(LOCAL_MODULE) *.o

