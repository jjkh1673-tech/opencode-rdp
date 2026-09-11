#!/bin/bash
echo "Starting Cloud Desktop Environment..."

# Railway assigns a dynamic port via the $PORT environment variable.
# If $PORT is not set, fallback to 6080.
LISTEN_PORT=${PORT:-6080}
echo "Railway assigned PORT: $LISTEN_PORT"

# Clean up any previous locks just in case
export DISPLAY=:0
rm -rf /tmp/.X0-lock /tmp/.X11-unix/X0

# 1. Start Headless X Server (Xvfb)
echo "Starting Xvfb..."
Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
sleep 2

# 2. Start Fluxbox Window Manager
echo "Starting Fluxbox..."
fluxbox &

# 3. Start VNC Server (x11vnc)
echo "Starting x11vnc..."
x11vnc -display :0 -nopw -forever -quiet -bg -xkb

# 4. Start Web Interface (noVNC) binding to Railway's dynamic PORT
echo "Starting websockify (noVNC) on port $LISTEN_PORT..."
nohup websockify --web=/usr/share/novnc/ $LISTEN_PORT localhost:5900 > /tmp/websockify.log 2>&1 &

echo "Desktop is running. Keeping container alive..."
tail -f /dev/null
