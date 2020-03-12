FROM alpine/git:1.0.9
ENV KUSTOMIZE_VERSION 3.5.4
RUN apk update \
    && apk add \
    bash \
    jq
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz kustomize.tar.gz
RUN tar -C /usr/local/bin -xf kustomize.tar.gz
RUN mkdir /opt/resource
ADD bin/* /opt/resource/
WORKDIR /tmp
