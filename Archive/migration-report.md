# Migration Report & File Classification

## 1. Archived (Deprecated / Broken / Replaceable)
All previous iterations of `.devcontainer.json`, `start-kiosk.sh`, and `setup-hermes.sh` have been classified as **Deprecated/Replaceable** due to:
* Heavy VNC/XRDP overhead.
* Port conflicts and blocking loops.
* Unnecessary permissions issues.

## 2. Active (New Architecture)
The repository has been restructured into a modular, production-grade DevOps layout:
* `.devcontainer/`: Entrypoint configurations.
* `docker/`: Contains the optimized Dockerfile based on Debian Bookworm (to avoid Ubuntu Snap Firefox issues).
* `scripts/`: Modular scripts (`install.sh`, `startup.sh`, `verify.sh`, `healthcheck.sh`).
* `configs/`: Future-proofing configuration directories.

## 3. Optimizations Applied
* Replaced heavy XFCE with ultra-lightweight **Fluxbox** window manager.
* Replaced TigerVNC with **Xvfb + x11vnc** for pure headless performance.
* Firefox ESR installed natively (Snap-free).
* Zed, OpenCode, and Hermes AI Desktop bindings created.
