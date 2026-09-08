FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Switch to root to perform installations and configurations
USER root

# Install XFCE4, XRDP, Git, and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y xfce4 xrdp dbus-x11 xorg git sudo curl x11-xserver-utils \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Fix XRDP session issue (allow reconnection without "console in progress" error)
RUN sed -i 's/port=-1/port=ask-1/g' /etc/xrdp/xrdp.ini \
    && sed -i 's/allow_channels=true/allow_channels=false/g' /etc/xrdp/xrdp.ini \
    && adduser xrdp ssl-cert

# Set root password to 'root' for RDP login
RUN echo "root:root" | chpasswd

# Install Node.js & NPM
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install OpenCode AI globally
RUN npm install -g opencode-ai

# Copy kiosk startup script
COPY start-kiosk.sh /usr/local/bin/start-kiosk.sh
RUN chmod +x /usr/local/bin/start-kiosk.sh
