#!/bin/bash
mkdir -p /workspaces/opencode-rdp-workspace
cd /workspaces/opencode-rdp-workspace

if [ ! -d "hermes-ai" ]; then
    git clone https://github.com/jjkh1673-tech/hermes-ai.git
fi

cd hermes-ai
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create the .env file with Together AI configuration automatically
cat << 'ENVFILE' > .env
TOGETHER_API_KEY="আপনার_TOGETHER_API_KEY_এখানে_দিন"
BASE_URL="https://api.together.xyz/v1"
DEFAULT_MODEL="NousResearch/Nous-Hermes-2-Mixtral-8x7B-DPO"
ENVFILE
