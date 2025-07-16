#!/usr/bin/env bash
set -e

if ! command -v docker &> /dev/null
then
    echo "[ERROR] Docker is not installed. Please install Docker to continue."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

IMAGE_NAME="fastapi-inventory-test"
CONTAINER_NAME="fastapi-inventory-test"

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "[INFO] Removing existing container $CONTAINER_NAME..."
    docker rm -f $CONTAINER_NAME
fi

set -x
docker build -t $IMAGE_NAME .
set +x

echo "[INFO] Starting container..."
docker run -d --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME

echo "[INFO] Backend service started in Docker container $CONTAINER_NAME on port 8000."
