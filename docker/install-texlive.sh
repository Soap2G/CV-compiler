#!/bin/bash
echo "------------> Downloading texlive 2020"
wget https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2020/tlnet-final/install-tl-unx.tar.gz || exit 1
mkdir -p $PWD/install-tl
tar --strip-components 1 -zxvf install-tl-unx.tar.gz -C "$PWD/install-tl" || exit 1

# Run the default installation with the specified profile.
./install-tl/install-tl -repository https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/2020/tlnet-final/ --profile=/root/texlive.profile

rm -rf ./install-tl ./install-tl-unx.tar.gz
