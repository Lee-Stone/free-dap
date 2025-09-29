#!/bin/bash

bin_files=($(find . -maxdepth 1 -type f -name "bootloader*.bin"))

BOOTLOADER_PATH="${bin_files[0]}"
OUTPUT_FILE="xiao_samd11.bin"

dd if=/dev/zero of="$OUTPUT_FILE" bs=1 count=$((0x1500))

dd if="$BOOTLOADER_PATH" of="$OUTPUT_FILE" bs=1 seek=$((0x1500)) conv=notrunc
