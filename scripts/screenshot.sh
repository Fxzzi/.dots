\#!/bin/bash

# Screenshot either monitor, a selection, or active window
# and then uploads with sharenix, copying the link to your
# clipboard.

tmpImage=$(mktemp /tmp/tmpImage.XXXXXXXXXX) # Makes a temporary file to save the screenshot to
mv "$tmpImage" "$tmpImage.png"
tmpImage="$tmpImage.png"

case $1 in
# Takes screenshot of primary monitor
  --monitor1)
    maim -uB -g 2560x1440+1920+0 $tmpImage 
    ;;
# Takes screenshot of secondary monitor
  --monitor2)
    maim -uB -g 1920x1080+0+180 $tmpImage
    ;;
# Takes screenshot of rectangle selection
  --selection)
    maim -suB $tmpImage
    ;;
# Takes screenshot of active window
  --active)
    maim -uB --window $(xdotool getactivewindow) $tmpImage
    ;;
  *)
    echo 'wrong or missing argument'
    ;;
esac

if [[ -e $tmpImage ]]; then
	dunstify -i $tmpImage -a "screenshot" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
	sharenix -c -q $tmpImage | xclip -i -sel cl
	exit $?
fi

echo "Screenshot cancelled."
exit 1
