#!/bin/bash
echo "Starting Cloud Desktop Environment..."
bash /usr/local/bin/startup.sh
echo "Desktop is running. Keeping container alive..."
tail -f /dev/null
