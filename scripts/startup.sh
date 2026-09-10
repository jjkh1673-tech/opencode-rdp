#!/bin/bash
# Headless Desktop Initialization
export DISPLAY=:0

# Cleanup old locks
rm -rf /tmp/.X0-lock /tmp/.X11-unix/X0

# 1. Start X Virtual Framebuffer (Xvfb)
Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
sleep 2

# 2. Start Fluxbox (Ultra-lightweight window manager)
fluxbox &

# 3. Start VNC Server
x11vnc -display :0 -nopw -forever -quiet -bg -xkb

# 4. Start noVNC Web Desktop (Port 6080)
nohup websockify --web=/usr/share/novnc/ 6080 localhost:5900 > /tmp/websockify.log 2>&1 &

# Keep container alive
tail -f /dev/null
