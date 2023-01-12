#!/bin/sh
set -eux

# To debug the Kernel with GDB, eun QEMU with the `-s` and `-S` flags:
#
#   $ qemu-system-x86_64 -s -S -m 512 -drive file=sundos.iso,format=raw
#
# and then remotely connect to the running QEMU instance with:
#
#   $ gdb -q --tui iso_root/sundos.elf
#   (gdb) target remote localhost:1234
#   (gdb) continue
qemu-system-x86_64 -m 512 -drive file=sundos.iso,format=raw
