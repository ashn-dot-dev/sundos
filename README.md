SundOS
======

SundOS is an example x86-64 kernel written in Sunder.

## Dependencies
```sh
$ apt-get install binutils build-essential git qemu-system-x86-64 xorriso
```

## Building and Running
```sh
$ sh sundos-init.sh   # Download Limine tooling
$ sh sundos-clean.sh  # Remove all build artifacts (optional)
$ sh sundos-build.sh  # Build the sundos ISO
$ sh sundos-run.sh    # Run the ISO with QEMU
```

## References
1. https://wiki.osdev.org/Limine_Bare_Bones
2. https://github.com/limine-bootloader/limine/blob/trunk/PROTOCOL.md#x86_64-1
