# dotfiles
My personal configuration files.

## Installation
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

## Backpack
Backpack is small utility to backup and restore a list of installed OS
pacakges. It handles multiple platforms and can be extended to support any
package manager. Each package manager has a provider that implements an
interface for Backpack to consume.

It consumes a lists of desired package manifests stored in
`~/.config/backpack/packages/<provider>/*`. Each manfiest is just a plaintext
list of package names that you want installed for a given provider, separated
by newlines. When installing, Backpack will simply compare the list of
installed packages against the desired list and install anything that is
missing. Backpack also handles setting up a provider, in the case that it is
not installed (e.g. downloading Homebrew on macOS).

During installation of the dotfiles, the base package manifest is copied from
the `base` directory. This is used to install dependencies for the installation
only. After this, individual Stow packages are expected to provide package
manifests for whatever else you want. Backpack is run after the Stow packages
are installed to install any dependencies.

[GNU Stow]: git@github.com:jamesbehr/dotfiles.git
