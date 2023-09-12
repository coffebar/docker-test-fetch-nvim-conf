#!/bin/bash
# Note: image take up 2GB of space

# build docker image
IMAGE_NAME="coffebar-neovim-config-archlinux"
docker build -t "$IMAGE_NAME" . || exit 1

# fetch nvim config setup script
CMD="$(wget -O- https://raw.githubusercontent.com/coffebar/dotfiles/master/fetch-nvim-conf.sh)"
# will run nvim after setup
CMD="$CMD ; nvim -c checkhealth"
# run code inside container and remove it after exit nvim
docker run --rm -it "$IMAGE_NAME" sh -c "$CMD"
