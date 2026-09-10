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
