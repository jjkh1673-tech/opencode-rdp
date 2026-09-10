#!/bin/bash
set -e
echo "Starting Application Installations..."

# 1. Install System Dependencies & Desktop Environment (Lightweight)
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends \
    xvfb fluxbox x11vnc novnc websockify \
    firefox-esr \
    curl wget git sudo jq \
    python3-pip python3-venv python3-dev \
    build-essential libssl-dev libffi-dev \
    libvulkan1 mesa-vulkan-drivers

# 2. Install Node.js & OpenCode AI
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
npm install -g opencode-ai

# 3. Install Zed (zcode) Editor
curl -f https://zed.dev/install.sh | bash

# 4. Install Hermes Desktop Agent (WebUI Wrapped)
mkdir -p /opt/hermes-ai
git clone https://github.com/jjkh1673-tech/hermes-ai.git /opt/hermes-ai || true
cd /opt/hermes-ai
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create Desktop Launcher for Hermes
cat << 'HERMES' > /usr/local/bin/hermes-desktop
#!/bin/bash
cd /opt/hermes-ai
source venv/bin/activate
python3 app.py &
sleep 5
firefox-esr -url http://127.0.0.1:7860
HERMES
chmod +x /usr/local/bin/hermes-desktop

echo "Installation Completed Successfully."
