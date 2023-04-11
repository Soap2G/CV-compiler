FROM python:3.8-buster as installer

LABEL maintainer="Atlas Physics Office Developers <atlas-phys-office-developers>"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        perl \
        ghostscript \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./docker/texlive.profile /root/texlive.profile
COPY ./docker/install-texlive.sh /root/install-texlive.sh

WORKDIR /root

RUN /root/install-texlive.sh

ENV PATH="/usr/share/bin/x86_64-linux:$PATH"

COPY ./docker/install-packages.sh /root/install-packages.sh

RUN /root/install-packages.sh

RUN rm -rf /root/texlive.profile \
        /root/install-texlive.sh \
        /root/install-packages.sh
