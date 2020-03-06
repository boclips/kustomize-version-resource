FROM alpine:3.9.5
RUN apk update \
    && apk add \
    bash \
    git \
    jq \
    openssh
RUN mkdir /opt/resource
ADD bin/* /opt/resource/
