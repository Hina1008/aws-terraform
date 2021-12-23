# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.205.2/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use hirsuite or bionic on local arm64/Apple Silicon): hirsute, focal, bionic
ARG VARIANT="hirsute"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ENV BREW /home/linuxbrew
ENV USER vscode

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# RUN brew install awscli
# RUN pip3 install aws-mfa

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    vim \
    sudo \
    locales \
    build-essential \
    ca-certificates \
    curl \
    file \
    git


RUN sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" && \
    sudo -S chown -R ${USER} ${BREW} && \
    echo 'export PATH="${BREW}/.linuxbrew/bin:$PATH"' >> /home/vscode/.bash_profile && \
    . /home/vscode/.bash_profile && \
    brew doctor && \
    brew install python@3.8 && \
    echo 'export PATH="${BREW}/.linuxbrew/opt/python@3.8/bin:$PATH"' >> /home/vscode/.bash_profile && \
    brew install awscli