ARG ALPINE_VERSION=1.31.1
FROM alpine/k8s:${ALPINE_VERSION}

ENV HELMFILE_VERSION=0.168.0

USER root
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
    echo $ARCH && \
    curl -sLO https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
    tar xvzf helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz && \
    mv helmfile /usr/bin/helmfile && \
    chmod +x /usr/bin/helmfile && \
    rm helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz

RUN apk add --update --no-cache jq sudo

# Make typing unicode characters in the terminal work.
ENV LANG=en_US.UTF-8

# Add a user `coder` so that you're not developing as the `root` user
RUN adduser -D -s /bin/bash -u 1000 && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder
