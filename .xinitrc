#!/bin/sh

wm="${WM:-awesome}"

# export TERMINAL="kitty"
export TERMINAL="alacritty"
export WINIT_X11_SCALE_FACTOR=1

exec "$wm"
