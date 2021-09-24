#!/usr/bin/env bash
killall -q eww
while pgrep -x eww; do sleep 1s; done
eww open-many river-bar river-bar-vertical
eww reload
