#!/usr/bin/env bash
if pgrep -x discord; then
  # running
  exit 0
else
  # open it
  flatpak run com.discordapp.Discord & disown
fi
