#!/usr/bin/env make -f
# Makefile to build brightness
# originally by Jon Stacey <jon@jonsview.com>

prefix=/usr/local

override CFLAGS += -mmacosx-version-min=10.6

all: build

build: brightness

brightness: brightness.o
	mkdir bin
	$(CC) $(CFLAGS) $(ARCH_FLAGS) -framework IOKit -framework ApplicationServices \
		-Wl,-U,_CGDisplayModeGetPixelWidth \
		-Wl,-U,_CGDisplayModeGetPixelHeight \
		$^ -o bin/brightness


