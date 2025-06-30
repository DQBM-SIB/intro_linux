# Use a lightweight Linux image
FROM ubuntu:24.04

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Set metadata
LABEL maintainer="deepak.tanwar@uzh.ch"
LABEL description="Simple Docker container for Bash teaching"

# Update and install necessary tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash coreutils nano vim curl wget \
        apt-utils sudo rsync gdebi-core && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the default shell
SHELL ["/bin/bash", "-c"]

# Copy bash config (use full path; ~ doesn't work in Dockerfile)
COPY .bashrc /root/.bashrc

# Start an interactive bash shell
CMD ["/bin/bash"]
