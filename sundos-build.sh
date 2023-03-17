#!/bin/sh
set -eux

# Compile the Kernel #

export SUNDER_BACKEND=nasm
export SUNDER_SYSASM_PATH=src/sys.asm
sunder-compile \
    -o sundos.elf -k \
    -l '-m' -l 'elf_x86_64' \
    -l '-z' -l 'max-page-size=0x1000' \
    -l '-T' -l 'linker.ld' \
    src/kernel.sunder

# Create the ISO #

# Build limine-deploy.
make -C limine

# Create a directory which will be our ISO root.
mkdir -p iso_root

# Copy the relevant files over.
cp -v sundos.elf limine.cfg limine/limine.sys \
      limine/limine-cd.bin limine/limine-cd-efi.bin iso_root/

# Create the bootable ISO.
xorriso -as mkisofs -b limine-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        --efi-boot limine-cd-efi.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        iso_root -o sundos.iso

# Install Limine stage 1 and 2 for legacy BIOS boot.
./limine/limine-deploy sundos.iso
