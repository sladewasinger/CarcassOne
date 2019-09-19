# cSpell:disable
FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && rm -rf packages-microsoft-prod.deb && \
    add-apt-repository universe && \
    apt-get update && apt-get -y -o APT::Install-Suggests="true" install dotnet-sdk-2.2 && \
    apt -y clean;

USER gitpod
# Apply user-specific settings
RUN npm install -g @angular/cli;

# Give back control
USER root
