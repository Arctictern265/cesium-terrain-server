#!/bin/sh

##
# Install the latest stable release of Go
#
# See <https://golang.org/doc/install/source>
#

cd /usr/local/src || exit 1
# hg clone -u release https://code.google.com/p/go || exit 1
#git clone -u release https://github.com/golang/go.git || exit 1
#cd go/src || exit 1
#./all.bash || exit 1
wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
#rm -rf /usr/local/go && tar -C /usr/local -xvf go1.23.2.linux-amd64.tar.gz
tar -C /usr/local -xvf go1.23.2.linux-amd64.tar.gz
#ln -s /usr/local/src/go/bin/go* /usr/local/bin/ || exit 1
ln -s /usr/local/go/bin/go* /usr/local/bin/ || exit 1
