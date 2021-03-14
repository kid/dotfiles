#!/bin/sh

session="${1:-awesome}"

export TERMINAL="alacritty"
export WINIT_X11_SCALE_FACTOR=1

if [ "$(hostname -s)" != "lenovo" ]; then
  xrandr --output DP-2 --scale 1x1 --mode 3840x1600 --rate 119.98 --pos 0x480 --primary
  xrandr --output DP-4 --scale 1x1 --mode 2560x1440 --rate 119.98 --pos 3840x0 --rotate left
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

case $session in
  awesome ) exec awesome;;
  leftwm  ) exec dbus-launch leftwm;;
  xterm   ) exec xterm;;
esac
