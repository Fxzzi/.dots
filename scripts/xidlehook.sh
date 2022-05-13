#!/usr/bin/bash

xidlehook \
  --not-when-audio \
  --timer 600 \
    '~/.scripts/lock.sh' \
    '' \
  --timer 300 \
    'systemctl suspend' \
    ''
