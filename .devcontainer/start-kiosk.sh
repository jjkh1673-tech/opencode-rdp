#!/bin/bash
# Keep background process alive forever
while true; do sleep 1000; done &

# Setup Kiosk script for root X session
cat << 'XSTARTUP' > /root/.xsession
# Disable screen blanking
xset s off
xset -dpms
xset s noblank

# Start only XFCE window manager (No panels/desktop)
xfwm4 &

# Launch OpenCode AI
opencode-ai
XSTARTUP

chmod +x /root/.xsession

# Start XRDP securely in background
service xrdp restart
