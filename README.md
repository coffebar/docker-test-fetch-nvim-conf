# Docker image to test coffebar/dotfiles/fetch-nvim-conf.sh

Build Docker image and run container where coffebar nvim config will be installed.

Neovim is fully functional inside the container.

```bash
git clone https://github.com/coffebar/docker-test-fetch-nvim-conf.git
cd docker-test-fetch-nvim-conf && sh ./build.sh
```

All packages and dependencies will be installed inside a temporary docker container.


Be patient. This operation can take up to 20 minutes and require at least 2GB of disk space.

You can later remove the docker image if you no longer plan to use it:

```bash
sh ./clean.sh
```

Note: AI and other credentials not included

### Install process video demo

https://github.com/coffebar/docker-test-fetch-nvim-conf/assets/3100053/029fa370-1d96-495c-889c-529a4fe4df98

*The video has been sped up
