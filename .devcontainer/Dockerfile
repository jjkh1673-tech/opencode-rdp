FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER root

# Install GUI, Python, Node/NPM, and dependencies all at once
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y xfce4 xfce4-goodies xfce4-terminal novnc websockify tigervnc-standalone-server dbus-x11 xorg git sudo curl x11-xserver-utils python3-pip python3-venv python3-dev nodejs npm \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install OpenCode AI
RUN npm install -g opencode-ai

# Copy scripts and make executable
COPY setup-hermes.sh /usr/local/bin/setup-hermes.sh
COPY start-kiosk.sh /usr/local/bin/start-kiosk.sh
RUN chmod +x /usr/local/bin/setup-hermes.sh /usr/local/bin/start-kiosk.sh
