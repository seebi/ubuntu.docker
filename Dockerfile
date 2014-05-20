# Seebis Base Ubuntu Dockerfile
#
# https://github.com/seebi/ubuntu.docker
#
# VERSION       0.1

FROM ubuntu:14.04
MAINTAINER Sebastian Tramp, mail@sebastian.tramp.name

# Install packages
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
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
  ln -s /root/.config/zsh/zshrc /root/.zshrc && \
  echo "RUN DONE"

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["byobu"]

