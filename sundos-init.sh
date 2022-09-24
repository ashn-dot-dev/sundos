#!/bin/sh
set -eux

if [ ! -d limine ]; then
    git clone https://github.com/limine-bootloader/limine.git --branch=v4.x-branch-binary --depth=1
fi
