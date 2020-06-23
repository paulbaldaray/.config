#!/bin/bash
xset s off
xset -dpms
xset s noblank
nitrogen --restore
nm-applet &
pa-applet &
picom &
