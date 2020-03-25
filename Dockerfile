FROM alpine:3.9.5 AS core
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
ADD resource/* /opt/resource/

FROM core AS test
ARG test_private_key
RUN apk add \
    make \
    ncurses
ADD Makefile /opt/
ADD test/* /opt/test/
WORKDIR /opt
ENV TERM=dumb TEST_PRIVATE_KEY="${test_private_key}"
RUN make test

FROM core as release
