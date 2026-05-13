#!/bin/bash

git submodule update --init --recursive

source ./keygen.sh
patch -bNp0 < patches/*.patch

