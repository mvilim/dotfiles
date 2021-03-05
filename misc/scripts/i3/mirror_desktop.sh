#!/bin/bash

CONFIG_DIR=`dirname "$0"`/i3/config

cat $CONFIG_DIR/config_mirror_outputs \
    $CONFIG_DIR/config_preamble \
    $CONFIG_DIR/config_mirror \
    $CONFIG_DIR/config_epilogue > \
    ~/.config/i3/config

# should we generate this in some way?
# should dedupe this with the config files as well

i3-msg restart
xrandr --output DP-2 --same-as DP-0

# should probably restore window visibility here
