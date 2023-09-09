#!/bin/bash
# remove docker image
docker images | grep coffebar-neovim-config-archlinux | awk '{print $3}' | xargs docker rmi
