ARG BASEIMAGE_VERSION=ubuntu
FROM codercom/enterprise-base:${BASEIMAGE_VERSION}

USER root

ARG ARCH

# docker build --no-cache --build-arg KUBECTL_VERSION=${tag} --build-arg HELM_VERSION=${helm} --build-arg KUSTOMIZE_VERSION=${kustomize_version} -t ${image}:${tag} .
ARG HELM_VERSION=3.2.1
ARG KUBECTL_VERSION=1.17.5
ARG KUSTOMIZE_VERSION=v3.8.1
ARG HELMFILE_VERSION=0.168.0

# Install helm (latest release)
# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
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
RUN . /envfile && echo ${ARCH} && \
    curl -sL https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz | tar -xvz && \
    mv linux-${ARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-${ARCH} && \
    # add helm-diff
    helm plugin install https://github.com/databus23/helm-diff && \
    # add helm-unittest
    helm plugin install https://github.com/helm-unittest/helm-unittest && \ 
    # add helm-push
    helm plugin install https://github.com/chartmuseum/helm-push && \
    # cleanup
    rm -rf /tmp/helm-* \
    /root/.local/share/helm/plugins/helm-push/testdata \
    /root/.cache/helm/plugins/https-github.com-chartmuseum-helm-push/testdata
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
