#!/bin/bash
export CC=arm-none-linux-gnueabi-gcc
chmod +x configure
./configure
make chronyd