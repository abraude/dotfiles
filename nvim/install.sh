#!/bin/sh

CONFIG_DIR=~/.config
export CONFIG_DIR

rm -rf $CONFIG_DIR/nvim

mkdir -p $CONFIG_DIR/nvim

stow --restow --target=$CONFIG_DIR/nvim .

