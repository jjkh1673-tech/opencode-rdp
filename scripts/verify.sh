#!/bin/bash
echo "Verifying Installations..." > /workspaces/opencode-rdp-workspace/verification-report.md
echo "--------------------------" >> /workspaces/opencode-rdp-workspace/verification-report.md

check_command() {
    if command -v $1 &> /dev/null; then
        echo "✅ $1 is installed: $(command -v $1)" >> /workspaces/opencode-rdp-workspace/verification-report.md
    else
        echo "❌ $1 is MISSING!" >> /workspaces/opencode-rdp-workspace/verification-report.md
    fi
}

check_command firefox-esr
check_command opencode-ai
check_command zed
check_command hermes-desktop

echo "" >> /workspaces/opencode-rdp-workspace/verification-report.md
echo "Port Status:" >> /workspaces/opencode-rdp-workspace/verification-report.md
netstat -tuln | grep -E "6080|5900|7860" >> /workspaces/opencode-rdp-workspace/verification-report.md || true
