#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

bash install.sh

sleep 2

echo "[INFO] Service should be available at http://localhost:8000/"
echo "[INFO] To stop the service: docker rm -f fastapi-inventory-test"