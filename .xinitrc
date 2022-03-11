#/bin/sh
picom &
sxhkd &
setxkbmap -option caps:escape & 
systemctl --user import-environment DISPLAY &
xrandr --output HDMI-1 --pos 1366x0 --primary --output eDP-1
ibus-daemon -drx & 
clipmenud &
redshift &
wal -R &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

~/.bin/statusbar &
while true; do
    dwm >/dev/null 2>&1
done  
