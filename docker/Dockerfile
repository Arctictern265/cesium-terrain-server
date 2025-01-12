##
# Image for the Cesium Terrain Server
#

# Ubuntu 14.04 Trusty Tahr
FROM ubuntu:22.04

# Set correct environment variables.
ENV HOME=/root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Update the location of the apt sources
RUN sed -i.org -e 's|ports.ubuntu.com|jp.archive.ubuntu.com|g' /etc/apt/sources.list && apt update -y

# Install dependencies
RUN apt install -y \
    wget \
    build-essential \
    git \
    mercurial \
    rsync \
    unzip

#copy source
COPY ./ /tmp/cesium-terrain-server/

# Install Go
ENV GOROOT_BOOTSTRAP=/usr
#ADD docker/install-go.sh /tmp/
#RUN /tmp/install-go.sh
RUN chmod 755 /tmp/cesium-terrain-server/docker/install-go.sh && /tmp/cesium-terrain-server/docker/install-go.sh

# Set the Go workspace
#ENV GOPATH=/usr/local/go/_vendor:/usr/local/go GOBIN=/usr/local/bin
ENV GOPATH=/usr/local GOBIN=/usr/local/bin

# Install the terrain server
#ADD local/ /tmp/local/
#ADD cts-checkout.txt install-terrain-server.sh /tmp/
#RUN /tmp/install-terrain-server.sh
RUN cd /tmp/cesium-terrain-server && go mod init cesium-terrain-server && make install

# Install Cesium.js
#ADD docker/cesium-version.txt docker/install-cesiumjs.sh /tmp/
RUN chmod 755 /tmp/cesium-terrain-server/docker/install-cesiumjs.sh && /tmp/cesium-terrain-server/docker/install-cesiumjs.sh

# Add our filesystem updates
#ADD ./root-fs /tmp/root-fs
RUN rsync -a /tmp/cesium-terrain-server/docker/root-fs/ /

# Expose the terrain server
EXPOSE 8000

# Clean up APT when done
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
