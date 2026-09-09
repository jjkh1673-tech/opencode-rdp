#!/bin/bash

# Cleanup any old VNC locks
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

mkdir -p /root/.vnc

# Create X startup script for Kiosk mode
cat << 'XSTARTUP' > /root/.vnc/xstartup
#!/bin/bash
xset s off
xset -dpms
xset s noblank

# Start Window Manager
xfwm4 &

# Autostart Hermes AI in a Terminal Window
xfce4-terminal --maximize --title="Hermes AI Server" -e "bash -c 'cd /workspaces/opencode-rdp-workspace/hermes-ai && source venv/bin/activate && python app.py; exec bash'" &
XSTARTUP

chmod +x /root/.vnc/xstartup

# Start VNC server on display :1 without password requirement
USER=root vncserver :1 -geometry 1920x1080 -depth 24 -SecurityTypes None

# Start WebSockets proxy for noVNC in the BACKGROUND!
nohup websockify --web=/usr/share/novnc/ 6080 localhost:5901 > /var/log/websockify.log 2>&1 &

# Exit successfully so Codespace finishes "Setting up..." status
exit 0
