# Use a lightweight Linux image
FROM ubuntu:24.04.2

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Set metadata
LABEL maintainer="deepak.tanwar@uzh.ch"
LABEL description="Simple Docker container for Bash teaching"

# Avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install bash + optional tools
RUN apt-get update && \
    apt-get install -y bash coreutils nano vim curl wget && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y sudo wget nano enacs rsync gdebi-core && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    

# Set the default shell
SHELL ["/bin/bash", "-c"]

COPY .bashrc ~/.bashrc

# Start an interactive bash shell
CMD ["/bin/bash"]
