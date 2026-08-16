#!/bin/sh

OSC_PORT=12345

xjadeo=""
for candidate in \
   "/Applications/Jadeo.app/Contents/MacOS/Jadeo" \
   "$HOME/Applications/Jadeo.app/Contents/MacOS/Jadeo"
do
   if [ -x "$candidate" ]; then
      xjadeo="$candidate"
      break
   fi
done


if [ -z "$xjadeo" ] && command -v xjadeo > /dev/null 2>&1; then
   xjadeo="xjadeo"
fi

if [ -z "$xjadeo" ]; then
   echo "XJadeo was not found."
   echo
   echo "Install XJadeo from a macOS build available from"
   echo "https://xjadeo.sourceforge.net/download.html"
   exit 1
fi

echo "Starting XJadeo, listening for OSC on port $OSC_PORT."
echo "Closing this window leaves XJadeo running; quit XJadeo itself to stop it."
echo

set -m
"$xjadeo" -O "$OSC_PORT" &
set +m
wait
