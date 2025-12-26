#include "baowm.h"
#include <xkbcommon/xkbcommon-keysyms.h>
#include <xkbcommon/xkbcommon.h>

#define MODKEY WLR_MODIFIER_ALT
#define TERMINAL "kitty"
#define MENU "wofi --show run"

static const struct keycode_map {
  xkb_keysym_t keysym;
  void (*handler)(struct baowm_server *server);
} keycodes[] = {
    {XKB_KEY_Escape, quit_handler},
    {XKB_KEY_F1, cycle_handler},
    {XKB_KEY_p, menu_handler},
    {XKB_KEY_Return, menu_handler},
};
