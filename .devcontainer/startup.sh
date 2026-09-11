#!/bin/bash
export DISPLAY=:0
rm -rf /tmp/.X0-lock /tmp/.X11-unix/X0

# Start Headless X Server
nohup Xvfb :0 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset > /tmp/xvfb.log 2>&1 &
sleep 2

# Start Window Manager
nohup fluxbox > /tmp/fluxbox.log 2>&1 &

# Start VNC
nohup x11vnc -display :0 -nopw -forever -quiet -bg -xkb > /tmp/x11vnc.log 2>&1 &

# Start Web Interface (noVNC)
nohup websockify --web=/usr/share/novnc/ ${PORT:-6080} localhost:5900 > /tmp/websockify.log 2>&1 &

# Also start Hermes AI server in the background for auto-readiness
if [ -d "/opt/hermes-ai" ]; then
    nohup bash -c "cd /opt/hermes-ai && source venv/bin/activate && python app.py" > /tmp/hermes.log 2>&1 &
fi

exit 0
