#!/bin/sh

COLLECTION_DIR="/data/music"
set -e

sudo find "$COLLECTION_DIR" -type d -exec chmod +t "{}" \;
sudo find "$COLLECTION_DIR" -type d -exec chmod g+w "{}" \;
sudo chown -R songkeeper:data "$COLLECTION_DIR"
