if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx $XDG_CONFIG_HOME/X11/xinitrc
fi
