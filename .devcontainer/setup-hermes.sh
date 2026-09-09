#!/bin/bash
# Clone the Hermes WebUI repository
git clone https://github.com/jjkh1673-tech/hermes-ai.git /workspaces/opencode-rdp-workspace/hermes-ai
cd /workspaces/opencode-rdp-workspace/hermes-ai

# Create a virtual environment and install dependencies
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create the .env file configured for Together AI (Hermes model)
cat << 'ENVFILE' > .env
# Together AI API Setup
TOGETHER_API_KEY="আপনার_TOGETHER_API_KEY_এখানে_দিন"
BASE_URL="https://api.together.xyz/v1"
DEFAULT_MODEL="NousResearch/Nous-Hermes-2-Mixtral-8x7B-DPO"
ENVFILE

echo "=================================================="
echo "Hermes AI Setup Complete!"
echo "Please edit the /workspaces/opencode-rdp-workspace/hermes-ai/.env file"
echo "and replace 'আপনার_TOGETHER_API_KEY_এখানে_দিন' with your actual Together AI API Key."
echo "Then, run: source venv/bin/activate && python app.py"
echo "=================================================="
