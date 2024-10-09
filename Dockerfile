FROM codercom/enterprise-minimal

ARG ARCH

# Ignore to update versions here
# docker build --no-cache --build-arg KUBECTL_VERSION=${tag} --build-arg HELM_VERSION=${helm} --build-arg KUSTOMIZE_VERSION=${kustomize_version} -t ${image}:${tag} .
ENV HELM_VERSION=3.16.1
ENV KUBECTL_VERSION=1.17.5
ENV KUSTOMIZE_VERSION=v5.4.3
ENV HELMFILE_VERSION=0.168.0

USER root

SHELL [ "/bin/bash", "-c" ]

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

# Install helm (latest release)
# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
#RUN case `uname -m` in \
#    x86_64) ARCH=amd64; ;; \
#    armv7l) ARCH=arm; ;; \
#    aarch64) ARCH=arm64; ;; \
#    ppc64le) ARCH=ppc64le; ;; \
#    s390x) ARCH=s390x; ;; \
#    *) echo "un-supported arch, exit ..."; exit 1; ;; \
#    esac && \
#    echo "export ARCH=$ARCH" > /envfile && \
#    cat /envfile

#RUN . /envfile && echo $ARCH && \
#    curl -sL https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz | tar -xvz && \
#    mv linux-${ARCH}/helm /usr/bin/helm && \
#    chmod +x /usr/bin/helm && \
#    rm -rf linux-${ARCH}

# add helm-diff
#RUN helm plugin install https://github.com/databus23/helm-diff && rm -rf /tmp/helm-*

# add helm-unittest
#RUN helm plugin install https://github.com/helm-unittest/helm-unittest && rm -rf /tmp/helm-*

# Install kubectl
#RUN . /envfile && echo $ARCH && \
#    curl -sLO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" && \
#    mv kubectl /usr/bin/kubectl && \
#    chmod +x /usr/bin/kubectl

# Install kustomize (latest release)
#RUN . /envfile && echo $ARCH && \
#    curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz && \
#    tar xvzf kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz && \
#    mv kustomize /usr/bin/kustomize && \
#    chmod +x /usr/bin/kustomize && \
#    rm kustomize_${KUSTOMIZE_VERSION}_linux_${ARCH}.tar.gz

# Install helmfile
#RUN . /envfile && echo $ARCH && \
#    curl -sLO https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
#    tar xvzf helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
#    mv helmfile /usr/bin/helmfile && \
#    chmod +x /usr/bin/helmfile && \
#    rm helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz

# Install openssl
#RUN apt-get install -y --no-install-recommends openssl openssh-client && \
#    rm -rf /var/lib/apt/lists/*

USER coder