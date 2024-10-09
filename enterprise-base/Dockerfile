FROM codercom/enterprise-base

USER root

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

USER coder
