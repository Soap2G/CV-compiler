FROM python:3.8-buster as installer
ENV DEBIAN_FRONTEND=noninteractive
USER root

LABEL maintainer="Giovanni Guerrieri"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        perl \
        ghostscript \
        texlive-xetex \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./docker/texlive.profile /root/texlive.profile
COPY ./docker/install-texlive.sh /root/install-texlive.sh

WORKDIR /root

RUN bash /root/install-texlive.sh

ENV PATH="/usr/share/texlive/2020/bin/x86_64-linux:$PATH"

COPY ./docker/install-packages.sh /root/install-packages.sh

RUN bash /root/install-packages.sh

RUN rm -rf /root/texlive.profile \
        /root/install-texlive.sh \
        /root/install-packages.sh