# Elite Cloud Development Environment

This repository has been autonomously refactored to provide a lightning-fast, highly optimized cloud desktop.

## Owned by: MY-LAB (User: EXPERIMENT)

## 🚀 Applications Pre-installed
1. **Firefox ESR** (Native, snap-free)
2. **Zed Editor** (Next-gen fast code editor)
3. **OpenCode AI**
4. **Hermes Desktop Agent**

## 🌐 Railway Deployment Guide (How to Access the Web Desktop)

Once you have deployed this repository to **Railway**, follow these exact steps to access your Web Desktop (noVNC):

1. **Wait for the Build:** Let Railway finish building the Docker container (it should say "Success").
2. **Go to Settings:** Click on your project/service in the Railway dashboard and go to the **Settings** tab.
3. **Generate a Domain:** Scroll down to the **"Networking"** or **"Domains"** section. Click on **Generate Domain** (or add your custom domain).
4. **Access the Desktop:** Click the generated link (e.g., `https://your-app.up.railway.app`).
5. **Open noVNC:** Railway automatically handles the port forwarding. Once the page loads, you will see the noVNC connection screen. Click **Connect**, and your Fluxbox Desktop will appear!

## 💻 Architecture
* **OS:** Debian Bookworm
* **Window Manager:** Fluxbox (Extremely low RAM footprint)
* **Display Server:** Xvfb
* **Access Protocol:** noVNC (Port 6080 defaults to Railway's dynamic $PORT)

## 🛠 Troubleshooting
If the domain shows a blank screen, wait 30 seconds and refresh. The background X11 server and window manager take a few moments to initialize on standard Railway hardware.
