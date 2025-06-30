#!/bin/bash

# Check if container 'biodocker' exists
if ! docker container ls -a --format '{{.Names}}' | grep -qw biodocker; then
  # Run new container as root with volume mount to /root/data
  winpty docker run --rm -v "$(pwd)/data:/root/data" --hostname linux --name linux -ti dktanwar/intro_linux bash --login
else
  # Start existing container and exec bash as root
  winpty docker container start linux > /dev/null 2>&1
  winpty docker exec -it linux bash
fi

