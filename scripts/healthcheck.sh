#!/bin/bash
echo "Running Healthcheck..."
netstat -tuln | grep 6080 || exit 1
ps aux | grep fluxbox || exit 1
echo "System is healthy."
