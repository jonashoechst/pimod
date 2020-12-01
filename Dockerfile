FROM debian:bullseye-slim

LABEL description="Reconfigure Raspberry Pi images with an easy, Docker-like configuration file"
LABEL maintainer="hoechst@mathematik.uni-marburg.de"
LABEL version="0.2"

RUN apt-get update && \
  apt-get install -y \
  binfmt-support \
  fdisk \
  file \
  kpartx \
  lsof \
  parted \
  qemu \
  qemu-user-static \
  unzip \
  p7zip-full \
  wget \
  xz-utils

RUN mkdir /pimod
COPY . /pimod/

ENV PATH="/pimod:${PATH}"
ENV PIMOD_CACHE=".cache"

WORKDIR /pimod
ENTRYPOINT ["/pimod/pimod.sh"]
