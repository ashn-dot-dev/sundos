#!/bin/sh
set -eux

# Compile the Kernel #

gcc -g -O2 -pipe -Wall -Wextra -std=c11 -ffreestanding -fno-stack-protector -fno-stack-check -fno-lto -fno-pie -fno-pic -m64 -march=x86-64 -mabi=sysv -mno-80387 -mno-mmx -mno-sse -mno-sse2 -mno-red-zone -mcmodel=kernel -Ilimine -c src/bootloader.c -o src/bootloader.o
SUNDER_SYSASM_PATH=src/sys.asm sunder-compile -k -l '-nostdlib' -l '-static' -l '-m' -l 'elf_x86_64' -l '-z' -l 'max-page-size=0x1000' -l '-T' -l 'linker.ld' -l src/bootloader.o -o sundos.elf src/kernel.sunder

# Create the ISO #

# Build limine-deploy.
make -C limine

# Create a directory which will be our ISO root.
mkdir -p iso_root

# Copy the relevant files over.
cp -v sundos.elf limine.cfg limine/limine.sys \
      limine/limine-cd.bin limine/limine-cd-efi.bin iso_root/

# Create the bootable ISO.
# TODO: Can xorriso be replaced with qemu-img?
xorriso -as mkisofs -b limine-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        --efi-boot limine-cd-efi.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        iso_root -o sundos.iso

# Install Limine stage 1 and 2 for legacy BIOS boot.
./limine/limine-deploy sundos.iso
