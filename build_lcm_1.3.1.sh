#!/bin/bash -e
# run with sudo
dir=$(pwd)
version=1.3.1
#wget -O lcm-${version}.tar.gz https://github.com/lcm-proj/lcm/archive/v${version}.tar.gz
#tar xvf lcm-${version}.tar.gz
#cd lcm-${version}
./bootstrap.sh
./configure
make -j4
checkinstall --nodoc \
  --fstrans=no \
  --pkgname=lcm \
  --pkggroup=GSS \
  --pkgversion=${version} \
  --provides=lcm \
  --backup=no \
  -y \
  --install=no \
  make install
mv *.deb $dir
