#!/usr/bin/env bash

xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 120 seconds, undim if user becomes active` \
  --timer 120 \
    'xrandr --output DP-2 --brightness 0.5 --output DP-4 --brightness 0.5' \
    'xrandr --output DP-2 --brightness 1 --output DP-4 --brightness 1' \
  `# Undim & lock after 280 more seconds` \
  --timer 280 \
    'xrandr --output DP-2 --brightness 0.3 --output DP-4 --brightness 0.3; ~/.local/scripts/lock.sh' \
    'xrandr --output DP-2 --brightness 1 --output DP-4 --brightness 1' \
  `# Finally, suspend 5 minutes after it locks` \
  --timer 300 \
    'xrandr --output DP-2 --brightness 1 --output DP-4 --brightness 1; systemctl suspend' \
    ''
