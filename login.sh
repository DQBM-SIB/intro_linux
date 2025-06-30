#!/bin/bash

# Get absolute path of current directory's data folder
HOST_DATA_DIR="$(pwd)/data"

# Check if container 'linux' exists
if ! docker container ls -a --format '{{.Names}}' | grep -qw linux; then
  # Container does not exist, run new container with volume mount
  docker run --user root --hostname linux --name linux -v "${HOST_DATA_DIR}:/root/data" -ti dktanwar/intro_linux bash --login
else
  # Container exists, start if stopped and exec bash
  docker container start linux > /dev/null 2>&1
  docker exec -it --user root linux bash
fi

