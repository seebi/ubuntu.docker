# Seebis Base Ubuntu Dockerfile
#
# https://github.com/seebi/ubuntu.docker

FROM ubuntu:16.04
MAINTAINER Sebastian Tramp, mail@sebastian.tramp.name

ENV ECC_IMAGE_PREFIX seebi
ENV ECC_IMAGE_NAME ubuntu

ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget make zsh exuberant-ctags

# Install zsh config
RUN \
  mkdir -p /root/.config/ /root/.cache/ && \
  git clone https://github.com/seebi/zshrc.git /root/.config/zsh/ && \
  cd /root/.config/zsh && \
  make install && \
  chsh -s /usr/bin/zsh root && \
  rm -f /root/.zshrc && ln -s /root/.config/zsh/zshrc /root/.zshrc && \
  echo "RUN DONE"

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["byobu"]

EXPOSE 80

