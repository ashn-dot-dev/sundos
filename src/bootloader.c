#include <stdint.h>
#include <stddef.h>

#include <limine.h>

static volatile struct limine_terminal_request terminal_request = {
    .id = LIMINE_TERMINAL_REQUEST,
    .revision = 0
};

void
terminal_write(char const* start, uint64_t count)
{
    if (terminal_request.response == NULL) {
        return;
    }
    if (terminal_request.response->terminal_count < 1) {
        return;
    }
    struct limine_terminal* terminal = terminal_request.response->terminals[0];
    terminal_request.response->write(terminal, start, count);
}
