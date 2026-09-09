#!/bin/bash
USER_HOME="/home/vscode"
mkdir -p $USER_HOME/.vnc

# Cleanup old locks
sudo rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver -kill :1 2>/dev/null || true
pkill websockify 2>/dev/null || true

cat << 'XSTARTUP' > $USER_HOME/.vnc/xstartup
#!/bin/bash
xset s off
xset -dpms
xset s noblank
xfwm4 &
xfce4-terminal --maximize --title="Hermes AI Server" -e "bash -c 'cd /workspaces/opencode-rdp-workspace/hermes-ai && source venv/bin/activate && python app.py; exec bash'" &
XSTARTUP

chmod +x $USER_HOME/.vnc/xstartup
chown -R vscode:vscode $USER_HOME/.vnc

# Start VNC
vncserver :1 -geometry 1920x1080 -depth 24 -SecurityTypes None

# Start noVNC
nohup websockify --web=/usr/share/novnc/ 6080 localhost:5901 > /tmp/websockify.log 2>&1 &

exit 0
