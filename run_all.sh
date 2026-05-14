#!/bin/bash

git submodule update --init --recursive

source ./keygen.sh

for f in patches/*.patch; do
  patch -bNp0 < "$f"
done

ln -s ../../../../../pico-fido2/tenstar_usb.h ../pico-sdk/src/boards/include/boards/

