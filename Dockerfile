FROM gitlab/gitlab-runner:latest

MAINTAINER ccrack <pk8995z@gmail.com>

RUN apt -y install git

ENV VERSION 0.65.3
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/ \
    && mkdir /siteroot \
    && chown -R gitlab-runner /siteroot
