FROM codercom/enterprise-base

USER root

ARG ARCH

# docker build --no-cache --build-arg KUBECTL_VERSION=${tag} --build-arg HELM_VERSION=${helm} --build-arg KUSTOMIZE_VERSION=${kustomize_version} -t ${image}:${tag} .
ARG KUBECTL_VERSION=1.31.1
ARG HELM_VERSION=3.16.2
ARG KUSTOMIZE_VERSION=v5.5.0
ARG HELMFILE_VERSION=0.168.0

# Install helm (latest release)
RUN case `uname -m` in \
    x86_64) ARCH=amd64; ;; \
    armv7l) ARCH=arm; ;; \
    aarch64) ARCH=arm64; ;; \
    ppc64le) ARCH=ppc64le; ;; \
    s390x) ARCH=s390x; ;; \
    *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac && \
    echo "export ARCH=$ARCH" > /envfile && \
    cat /envfile

# Install helm (latest release)
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    apt-get update && \
    apt-get install apt-transport-https --yes && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install helm
#RUN . /envfile && \
    #echo ${ARCH} && \
    #echo ${HELM_VERSION} && \
    #curl -sLO https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz
    # | tar -xvz && \
    # mv linux-${ARCH}/helm /usr/bin/helm && \
    # chmod +x /usr/bin/helm && \
    # rm -rf linux-${ARCH} 
# add helm-diff
RUN helm plugin install https://github.com/databus23/helm-diff && \
    rm -rf /tmp/helm-* 
# add helm-unittest
RUN helm plugin install https://github.com/helm-unittest/helm-unittest && \
    rm -rf /tmp/helm-* 

# Install kubectl
RUN . /envfile && echo ${ARCH} && \
    curl -sLO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

# Install kustomize (latest release)
RUN . /envfile && echo ${ARCH} && \
    curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz && \
    tar xvzf kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz && \
    mv kustomize /usr/bin/kustomize && \
    chmod +x /usr/bin/kustomize && \
    rm kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz

# Install helmfile    
RUN . /envfile && echo ${ARCH} && \
    curl -sLO https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
    tar xvzf helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
    mv helmfile /usr/bin/helmfile && \
    chmod +x /usr/bin/helmfile && \
    rm helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz

USER coder
