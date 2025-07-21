#!/bin/bash

# Get absolute path to data directory
HOST_DATA_DIR="$(pwd)/data"

# Create data directory if it doesn't exist
if [ ! -d "$HOST_DATA_DIR" ]; then
  echo "Creating data directory at: $HOST_DATA_DIR"
  mkdir -p "$HOST_DATA_DIR"
fi

# Detect platform to use winpty on Windows Git Bash
DOCKER_CMD="docker"
case "$(uname -s)" in
  MINGW*|CYGWIN*) DOCKER_CMD="winpty docker" ;;
esac

# Check if container named 'linux' exists
if ! docker container ls -a --format '{{.Names}}' | grep -qw linux; then
  echo "Container 'linux' not found. Creating new container..."
  $DOCKER_CMD run --user root --hostname linux --name linux -v "${HOST_DATA_DIR}:/root/data" -ti dktanwar/intro_linux bash --login
else
  echo "Container 'linux' exists. Starting and attaching..."
  docker container start linux > /dev/null 2>&1
  $DOCKER_CMD exec -it --user root linux bash
fi
