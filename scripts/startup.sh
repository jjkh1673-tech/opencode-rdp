#!/bin/bash
export DISPLAY=:0
rm -rf /tmp/.X0-lock /tmp/.X11-unix/X0

Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
sleep 2

fluxbox &
x11vnc -display :0 -nopw -forever -quiet -bg -xkb
nohup websockify --web=/usr/share/novnc/ 6080 localhost:5900 > /tmp/websockify.log 2>&1 &

exit 0
