Packaging scripts for the ondevice client
====================

This repository contains the official build-scripts for binaries and packages published at https://repo.ondevice.io/

Debian packages (`.deb`) are built inside docker containers, raw binaries using go directly.

The easiest way to install the packages is `install_deb.sh`:

    curl -sSL https://repo.ondevice.io/install_deb.sh | sudo bash -e

Install scripts
---------------

For POSIX based systems (so far Linux and MacOS) we provide a simple bash script for installing the ondevice commandline
client.

```bash
curl -sSL https://repo.ondevice.io/install.sh | sudo bash -
```

So far it supports Linux (amd64, armhf and i386) and MacOS (amd64 and i386)


Debian repository
-----------------

We provide a `.deb` repository for Debian based Linux distributions (Debian/Ubuntu/Raspbian/Mint/...).

We strongly recommend using these prepackaged debian packages on those systems (since they'll get updated along with your other software and also include the `ondevice-daemon` package for added convenience).

The simplest way to use them is by using the aforementioned install script.

Alternatively, you can manually set things up using:

```bash
echo "deb http://repo.ondevice.io/debian stable main" | sudo tee /etc/apt/sources.list.d/ondevice.list
curl https://repo.ondevice.io/ondevice.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install ondevice

# and if you want to autostart `ondevice daemon`:
sudo apt-get install ondevice-daemon
```


