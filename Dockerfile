FROM mcr.microsoft.com/devcontainers/base:bookworm

USER root

# Install Core GUI & Dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    xvfb fluxbox x11vnc novnc websockify firefox-esr \
    curl wget git sudo jq python3-pip python3-venv python3-dev \
    build-essential libssl-dev libffi-dev ca-certificates gnupg \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Node.js & OpenCode AI safely
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g opencode-ai \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Copy configuration scripts
COPY .devcontainer/install-user.sh /usr/local/bin/install-user.sh
COPY .devcontainer/startup.sh /usr/local/bin/startup.sh
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/*.sh

# Run the installation script
RUN /usr/local/bin/install-user.sh

# Allow the platform to set the port dynamically
ENV PORT=6080
EXPOSE $PORT

# Start the environment
CMD ["/usr/local/bin/start.sh"]
