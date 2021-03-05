#!/bin/bash

CONFIG_DIR=`dirname "$0"`/i3/config

cat $CONFIG_DIR/config_extend_outputs \
    $CONFIG_DIR/config_preamble \
    $CONFIG_DIR/config_extend \
    $CONFIG_DIR/config_epilogue > \
    ~/.config/i3/config

# horrible, horrible, timing stuff going on right here (begin restarting i3 in place, then swap out the )
i3-msg restart&
xrandr --output DP-2 --left-of DP-0

# retry until i3 is up
n=0
until [ $n -ge 10 ]
do
    i3-msg nop && break  # substitute your command here
    n=$[$n+1]
    sleep 0.2
done

# should probably restore window visibility here
