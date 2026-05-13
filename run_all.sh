#!/bin/bash

git submodule sync --recursive
git submodule update --init --recursive

source ./keygen.sh

patch -p0 -b < patches/*.patch

