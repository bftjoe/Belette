
export TARGET_EXEC := babchess
export BUILD_DIR := ./build
export SRC_DIR := ./src

CPPFLAGS := -Wall -std=c++20 -fno-exceptions -fno-rtti -mbmi -mbmi2 -mpopcnt -msse2 -msse3 -msse4.1 -mavx2
DEBUG_CPPFLAGS := $(CPPFLAGS) -g -O0 -DDEBUG
RELEASE_CPPFLAGS := $(CPPFLAGS) -O3 -funroll-loops -finline -fomit-frame-pointer -flto -DNDEBUG

LDFLAGS := -Wall -std=c++20 -fno-exceptions -fno-rtti -mbmi -mbmi2 -mpopcnt -msse2 -msse3 -msse4.1 -mavx2
DEBUG_LDFLAGS := $(LDFLAGS)
RELEASE_LDFLAGS := $(LDFLAGS) -flto

.PHONY: all debug release

all: debug release

release:
	$(MAKE) -f build.mk TARGET=Release CPPFLAGS='$(RELEASE_CPPFLAGS)' LDFLAGS='$(RELEASE_LDFLAGS)'

debug:
	$(MAKE) -f build.mk TARGET=Debug CPPFLAGS='$(DEBUG_CPPFLAGS)' LDFLAGS='$(DEBUG_LDFLAGS)'

clean:
	$(MAKE) -f build.mk clean TARGET=Debug
	$(MAKE) -f build.mk clean TARGET=Release