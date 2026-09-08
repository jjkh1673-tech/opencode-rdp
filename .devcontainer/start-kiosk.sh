#!/bin/bash

# Setup Kiosk script for root X session
cat << 'XSTARTUP' > /root/.xsession
#!/bin/bash
xset s off
xset -dpms
xset s noblank
xfwm4 &
opencode-ai
XSTARTUP
chmod +x /root/.xsession

# Start dbus (required for some XFCE components)
/etc/init.d/dbus start || true

# Start XRDP safely
/etc/init.d/xrdp start || true
sleep 2

# Check if xrdp is running, if not start it directly
if ! pgrep xrdp > /dev/null; then
    xrdp-sesman
    xrdp
fi

# Keep background process alive forever
tail -f /var/log/xrdp.log /var/log/xrdp-sesman.log
