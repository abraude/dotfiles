#!/bin/sh

CONFIG_DIR=~/.config
export CONFIG_DIR

rm -rf $CONFIG_DIR/kitty

mkdir -p $CONFIG_DIR/kitty

stow --restow --target=$CONFIG_DIR/kitty .

