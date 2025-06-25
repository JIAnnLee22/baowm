PKG_CONFIG = pkg-config
WAYLAND_PROTOCOLS = $(shell $(PKG_CONFIG) --variable=pkgdatadir wayland-protocols)
WAYLAND_SCANNER = $(shell $(PKG_CONFIG) --variable=wayland_scanner wayland-scanner)
PKGS = wlroots-0.19 wayland-server xkbcommon
CFLAGS_PKG_CONFIG = $(shell $(PKG_CONFIG) --cflags $(PKGS))
CFLAGS += $(CFLAGS_PKG_CONFIG)
LIBS = $(shell $(PKG_CONFIG) --libs $(PKGS))

all: jwl

# wayland-scanner is a tool which generates C headers and rigging for Wayland
# protocols, which are specified in XML. wlroots requires you to rig these up
# to your build system yourself and provide them in the include path.
xdg-shell-protocol.h:
	$(WAYLAND_SCANNER) server-header \
		$(WAYLAND_PROTOCOLS)/stable/xdg-shell/xdg-shell.xml $@

jwl.o: jwl.c xdg-shell-protocol.h
	$(CC) -c $< -g -Werror $(CFLAGS) -I. -DWLR_USE_UNSTABLE -o $@

jwl: jwl.o
	$(CC) $^ -g -Werror $(CFLAGS) $(LDFLAGS) $(LIBS) -o $@

clean:
	rm -f jwl jwl.o xdg-shell-protocol.h

.PHONY: all clean
