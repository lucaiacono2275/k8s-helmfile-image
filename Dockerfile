FROM codercom/enterprise-base:ubuntu  

ARG ARCH=arm64
ARG HELM_VERSION=3.16.1
ARG HELMFILE_RELEASE=0.168.0

# Configure apt and install packages
RUN apt-get update \
    && apt-get install -y kubectl 2>&1 \ 
    #

#RUN \
    # Install Helm
    #&& curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz \
    #&& tar -zxvf helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz \
    #&& mv linux-${ARCH}/helm /usr/local/bin/helm  

#RUN \
    # Install helmfile
    #&& curl -LO "https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_RELEASE}/helmfile_${HELMFILE_RELEASE}_linux_arm64.tar.gz" \
    #&& tar zxvf helmfile_${HELMFILE_RELEASE}_linux_arm64.tar.gz \
    #&& sudo mv helmfile /usr/local/bin 
    # Install helm-unittest
