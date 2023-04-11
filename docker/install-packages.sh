#!/bin/sh

tlmgr option repository https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2020/tlnet-final/
tlmgr update --self
tlmgr install biber || exit 1
tlmgr update --self --all
tlmgr update biblatex

# Trim down (possibly large amounts of) installed artifacts such as docs.
rm -rf /usr/share/texlive/2020/doc.html  \
       /usr/share/texlive/2020/readme-html.dir \
       /usr/share/texlive/2020/readme-txt.dir \
       /usr/share/texlive/2020/install-tl* \
       /usr/share/texlive/2020/install-tl.log \
       /usr/share/texlive/2020/texmf-dist/doc
