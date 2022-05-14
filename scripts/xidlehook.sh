#!/usr/bin/bash

xidlehook \
  --not-when-audio \
  --timer 600 \
    '~/.local/scripts/lock.sh' \
    '' \
  --timer 300 \
    'systemctl suspend' \
    ''
