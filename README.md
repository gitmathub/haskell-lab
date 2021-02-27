# Haskell Lab

Learning resources for the programming language Haskell

- [Haskell Lab](#haskell-lab)
  - [Arch Linux hints](#arch-linux-hints)
    - [Docker commands](#docker-commands)
    - [Packman](#packman)
    - [Install the most basic packets](#install-the-most-basic-packets)
    - [Configure groups and user](#configure-groups-and-user)
  - [Install Haskell](#install-haskell)
  - [Learn Haskell](#learn-haskell)
    - [Tutorials](#tutorials)
    - [Haskell Shell](#haskell-shell)

## Arch Linux hints

Arch Linux has nothing to do with Huskell but as a matter of fact, it is the platform on which I am suppose to learn programming Haskell. That's why I have Arch Linux running as a Docker container on my Mac.

### Docker commands

Fire up docker container and open an interactive (`-i`) terminal (`-t`) with a `bash` shell.
```sh
docker run -it --privileged=true archlinux:latest bash
```

### Packman

The package manager [pacman](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)

example: Install *nano*
```sh
pacman -Syu nano
```
Operations:
- S - Sync with database

Options:
- y - refresh
- u - upgrade installed packages

Operations help:
```sh
# show operations
$ packman --help

usage:  pacman <operation> [...]
operations:
    pacman {-h --help}
    pacman {-V --version}
    pacman {-D --database} <options> <package(s)>
    pacman {-F --files}    [options] [package(s)]
    pacman {-Q --query}    [options] [package(s)]
    pacman {-R --remove}   [options] <package(s)>
    pacman {-S --sync}     [options] [package(s)]
    pacman {-T --deptest}  [options] [package(s)]
    pacman {-U --upgrade}  [options] <file(s)>

# show options on Sync
$ packmann -S --help

usage:  pacman {-S --sync} [options] [package(s)]
options:
members)
  -i, --info           view package information (-ii for extended information)
  -l, --list <repo>    view a list of packages in a repo
  -q, --quiet          show less information for query and search
  -s, --search <regex> search remote repositories for matching strings
  -u, --sysupgrade     upgrade installed packages (-uu enables downgrades)
  -y, --refresh        download fresh package databases from the server
...
```

### Install the most basic packets

```sh
pacman -Syu vi sudo
```

### Configure groups and user
```sh
# configure sudo and un-comment the wheels group
sudo visudo
# %wheel ALL=(ALL) ALL

# use useradd to also generate a home dir
useradd -G wheel -m <username> -p <password>

# change to new user
su - <username>
```

## Install Haskell

Wiki about [Haskell on Arch Linux](https://wiki.archlinux.org/index.php/Haskell)

Install the *Glasgow Haskell Compiler* `ghc`
```sh
sudo pacman -Syu ghc
```

Done. That's it if you use the console only. Else checkout the Arch Linux Wiki about [Visual Studio Code](https://wiki.archlinux.org/index.php/Visual_Studio_Code)

## Learn Haskell

### Tutorials

- [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)

### Haskell Shell

It's an easy way to follow along the tutorial by using interactivley the shell.

Start the shell and [start with the tutorial](http://learnyouahaskell.com/starting-out)
```sh
ghci
```
