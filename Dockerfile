# Use the official Arch Linux base image
FROM archlinux

# Update the package database and install required packages
RUN pacman -Syu --noconfirm git sudo

# Create a new user named 'neovim'
RUN useradd -m neovim

# Add the 'neovim' user to the 'wheel' group
RUN usermod -aG wheel neovim

# Allow 'neovim' user to execute sudo without a password
RUN echo "neovim ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the 'neovim' user and perform further setup
USER neovim

WORKDIR /home/neovim

