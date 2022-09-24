#!/bin/sh
set -eux

rm -f $(find . -type f -name '*.d')
rm -f $(find . -type f -name '*.elf')
rm -f $(find . -type f -name '*.iso')
rm -f $(find . -type f -name '*.o')
rm -f $(find . -type f -name '*.out')

rm -rf iso_root
