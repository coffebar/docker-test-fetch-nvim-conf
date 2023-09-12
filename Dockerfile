# Use the official Arch Linux base image
FROM archlinux

# Update the package database and install base-devel, git, and wget
RUN pacman -Syu --noconfirm base-devel git wget

# Create a new user named 'neovim'
RUN useradd -m neovim

# Add the 'neovim' user to the 'wheel' group
RUN usermod -aG wheel neovim

# Allow 'neovim' user to execute sudo without a password
RUN echo "neovim ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the 'neovim' user and perform further setup
USER neovim

# Clone the 'yay' AUR helper and install it
RUN cd /tmp/ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg --noconfirm -si && yay -Y --gendb && yay -y

WORKDIR /home/neovim

ENV PATH="/home/neovim/.local/share/pnpm:/home/neovim/.node_modules/bin:/home/neovim/go/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/rustup/bin"

