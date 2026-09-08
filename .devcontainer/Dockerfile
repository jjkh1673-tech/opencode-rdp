FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER root

# Install XFCE4, noVNC, TigerVNC and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y xfce4 xfce4-goodies novnc websockify tigervnc-standalone-server dbus-x11 xorg git sudo curl x11-xserver-utils \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Node.js & NPM
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install OpenCode AI globally via NPM
RUN npm install -g opencode-ai

# Copy kiosk startup script and make it executable
COPY start-kiosk.sh /usr/local/bin/start-kiosk.sh
RUN chmod +x /usr/local/bin/start-kiosk.sh
