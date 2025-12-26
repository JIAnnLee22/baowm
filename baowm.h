#ifndef BAOWM_H
#define BAOWM_H

#define EXECL(command)                                                         \
  {                                                                            \
    execl("/bin/sh", "/bin/sh", "-c", command, (void *)NULL);                  \
  }

typedef struct baowm_server baowm_server;
typedef struct baowm_output baowm_output;
typedef struct baowm_toplevel baowm_toplevel;
typedef struct baowm_popup baowm_popup;
typedef struct baowm_keyboard baowm_keyboard;

static void quit_handler(struct baowm_server *server);
static void cycle_handler(struct baowm_server *server);
static void menu_handler(struct baowm_server *server);
static void menu_handler(struct baowm_server *server);
#endif
