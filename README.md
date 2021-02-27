# Haskell Lab

Learning resources for the programming language Haskell

- [Haskell Lab](#haskell-lab)
  - [Arch Linux hints](#arch-linux-hints)
    - [Docker commands](#docker-commands)
    - [Packman](#packman)

## Arch Linux hints

Arch Linux has nothing to do with Huskell but as a matter of fact, it is the platform on which I am suppose to learn programming Haskell. That's why I have Arch Linux running as a Docker container on my Mac.

### Docker commands

Fire up docker container and open an interactive (`-i`) terminal (`-t`) with a `bash` shell.
```sh
docker run -it --privileged=true archlinux:latest bash
```

### Packman

Install package manager **pacman**: [How to Use Packman on Arch Linux](https://linuxhint.com/pacman_arch_linux/)

