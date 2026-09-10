FROM mcr.microsoft.com/devcontainers/base:bookworm
USER root
COPY scripts/ /usr/local/bin/scripts/
RUN chmod +x /usr/local/bin/scripts/*.sh
RUN /usr/local/bin/scripts/install.sh
