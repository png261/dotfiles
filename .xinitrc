#!/bin/sh
systemctl --user import-environment DISPLAY &

picom &
sxhkd &
ibus-daemon -drx & 
clipmenud &
redshift &
flameshot & 
~/.bin/statusbar &
xrandr --output HDMI-1 --pos 1366x0 --primary --output eDP-1 &
png_wal &

while true; do
    dwm >/dev/null 2>&1
done  

