FROM codercom/enterprise-base:ubuntu  

ARG ARCH=arm64
ARG HELM_VERSION=3.16.1
ARG HELMFILE_RELEASE=0.168.0

# Install packages
RUN \
    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" \
    && chmod +x ./kubectl \
    && sudo mv ./kubectl /usr/local/bin/kubectl \
    # Install Helm
    && curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz \
    && tar -zxvf helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz \
    && mv linux-${ARCH}/helm /usr/local/bin/helm  \
    # Install helmfile
    && curl -LO "https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_RELEASE}/helmfile_${HELMFILE_RELEASE}_linux_arm64.tar.gz" \
    && tar zxvf helmfile_${HELMFILE_RELEASE}_linux_arm64.tar.gz \
    && sudo mv helmfile /usr/local/bin \
    # Install helm-unittest
