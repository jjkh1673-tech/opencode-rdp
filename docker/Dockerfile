# Using Debian Bookworm to ensure snap-free native Firefox ESR and stable packages
FROM mcr.microsoft.com/devcontainers/base:bookworm

USER root

# Copy modular scripts
COPY scripts/ /usr/local/bin/scripts/
RUN chmod +x /usr/local/bin/scripts/*.sh

# Execute unified installation
RUN /usr/local/bin/scripts/install.sh

# Set Entrypoint
ENTRYPOINT ["/usr/local/bin/scripts/startup.sh"]
