#!/bin/bash
set -e
echo "Installing Zed Editor..."
curl -f https://zed.dev/install.sh | bash || true

echo "Setting up Hermes AI..."
mkdir -p /opt/hermes-ai
if [ ! -d "/opt/hermes-ai/venv" ]; then
    git clone https://github.com/jjkh1673-tech/hermes-ai.git /opt/hermes-ai || true
    cd /opt/hermes-ai
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt || true
fi

# Create Hermes Desktop Launcher
cat << 'HERMES' > /usr/local/bin/hermes-desktop
#!/bin/bash
cd /opt/hermes-ai
source venv/bin/activate
python3 app.py &
sleep 5
firefox-esr -url http://127.0.0.1:7860
HERMES
chmod +x /usr/local/bin/hermes-desktop

echo "User setup complete."
