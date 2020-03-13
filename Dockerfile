FROM alpine:3.9.5
ENV KUSTOMIZE_VERSION 3.5.4
RUN apk --update add \
    bash \
    git \
    jq \
    openssh \
    && rm -rf /var/cache/apk/*
RUN wget -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
    | tar x -z -C /usr/local/bin -f -
RUN mkdir /opt/resource
ADD bin/* /opt/resource/
