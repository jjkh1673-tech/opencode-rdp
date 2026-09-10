#!/bin/bash
export DISPLAY=:0
rm -rf /tmp/.X0-lock /tmp/.X11-unix/X0

# Start Headless X Server
Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
sleep 2

# Start Window Manager
fluxbox &

# Start VNC
x11vnc -display :0 -nopw -forever -quiet -bg -xkb

# Start Web Interface (noVNC)
nohup websockify --web=/usr/share/novnc/ 6080 localhost:5900 > /tmp/websockify.log 2>&1 &

exit 0
