#!/bin/bash
IMAGE_NAME="coffebar-neovim-config-archlinux"
# Note: image take up 2GB of space
if ! docker image inspect "$IMAGE_NAME" &> /dev/null; then
	# build image if it doesn't exist
	docker build -t "$IMAGE_NAME" .
fi

# fetch nvim config setup script
CMD="$(wget -O- https://raw.githubusercontent.com/coffebar/dotfiles/master/fetch-nvim-conf.sh)"
# will run nvim after setup
CMD="$CMD ; nvim"
# run container and remove it after exit nvim
docker run --rm -it --user neovim \
	-e PATH='/home/neovim/.node_modules/bin:/home/neovim/go/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/rustup/bin' \
	-w /home/neovim \
	"$IMAGE_NAME" sh -c "$CMD"
