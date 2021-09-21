#!/usr/bin/env bash

killall -q waybar
killall -q ristate
while pgrep -x waybar >/dev/null; do sleep 2s; done
exec waybar & disown
exit
