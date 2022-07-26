# dotfiles
My personal configuration files.

# Installation
To install the dotfiles, simply run the following in your shell. This will
clone the repo to `~/dotiles` and run the installation script.

    curl https://raw.githubusercontent.com/jamesbehr/dotfiles/main/install | bash

After installation, upgrading the dotfiles is as simple as running the install
script again.

    cd ~/dotfiles
    ./install

My dotfiles are managed with [GNU Stow]. Each subdirectory in this repository
is a package, containing a subset of my home directory. When a package is
installed, Stow will copy the file hierarchy inside the package directory into
the home directory by creating symlinks to each file.

Since everything is symlinked, editing the dotfiles can be done directly inside
the repository. Reinstalling is only necessary when a new file is added or a
file is removed.

The list of packages installed is set in the `DOTFILES_PACKAGES` environment
variable, which is usually set sourcing `~/.dotfilesrc`. Each package is
separated by a `:`. You can modify this list of packages and re-run the
installation script.

[GNU Stow]: git@github.com:jamesbehr/dotfiles.git
