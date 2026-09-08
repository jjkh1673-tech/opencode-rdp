#!/bin/bash

# Setup VNC configuration directory for root
mkdir -p /root/.vnc

# Create X startup script for Kiosk mode
cat << 'XSTARTUP' > /root/.vnc/xstartup
#!/bin/bash
xset s off
xset -dpms
xset s noblank
xfwm4 &
opencode-ai
XSTARTUP

chmod +x /root/.vnc/xstartup

# Start VNC server on display :1 without password requirement
USER=root vncserver :1 -geometry 1920x1080 -depth 24 -SecurityTypes None

# Start WebSockets proxy for noVNC (redirects web traffic to VNC)
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

# Keep codespace alive forever
while true; do sleep 1000; done
