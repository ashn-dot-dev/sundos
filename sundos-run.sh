#!/bin/sh
set -eux

qemu-system-x86_64 -m 512 -drive file=sundos.iso,format=raw
