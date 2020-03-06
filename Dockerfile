FROM alpine:3.9.5
RUN apk update \
    && apk add \
    bash \
    git \
    jq \
    openssh
RUN mkdir /opt/resource
ADD bin/check /opt/resource/check
ADD bin/in /opt/resource/in
ADD bin/out /opt/resource/out
