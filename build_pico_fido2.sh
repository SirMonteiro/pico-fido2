#!/bin/bash

VERSION_MAJOR="7"
VERSION_MINOR="6"
ENABLE_EDDSA=1
SUFFIX="${VERSION_MAJOR}.${VERSION_MINOR}"
#if ! [[ -z "${GITHUB_SHA}" ]]; then
#    SUFFIX="${SUFFIX}.${GITHUB_SHA}"
#fi

mkdir build_release
mkdir release
cd build_release

PICO_SDK_PATH="${PICO_SDK_PATH:-../../pico-sdk}"
board_dir=${PICO_SDK_PATH}/src/boards/include/boards
SECURE_BOOT_PKEY="${SECURE_BOOT_PKEY:-../ec_private_key.pem}"
boards=("tenstar_usb")

for board in "${boards[@]}"
do
    PICO_SDK_PATH="${PICO_SDK_PATH}" cmake .. -DPICO_BOARD=$board -DSECURE_BOOT_PKEY=${SECURE_BOOT_PKEY} -DENABLE_EDDSA=${ENABLE_EDDSA} -DVIDPID=Yubikey5
    make -j`nproc`
    mv pico_fido2.uf2 ../release/pico_fido2_$board_name-$SUFFIX.uf2
done
