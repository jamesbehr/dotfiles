# dotfiles
My personal configuration files.

## Installation
To install the dotfiles, simply run the following in your shell. This will
clone the repo to `~/dotfiles` and run the installation script.

    curl https://raw.githubusercontent.com/jamesbehr/dotfiles/main/bootstrap | bash

After installation, upgrading the dotfiles is as simple as running the install
script again.

    cd ~/dotfiles
    ./update

My dotfiles are managed by [Stowaway](https://github.com/jamesbehr/stowaway) a
tool which manages symlinks. Each dotfile is created as a symlink to one of the
files in this repo.
