<hr />

# Deprecation Notice

The scripts in this package have been moved to the main https://github.com/ondevice/ondevice/ repository (to simplify packaging).  
The install.sh got its own repository at https://github.com/ondevice/get.ondevice.io/

This repo will soon be removed.
<hr />

Packaging scripts for the ondevice client
====================

This repository contains all the packaging scripts for the `ondevice` commandline interface.  
Most of the builds are done inside [docker][docker].

If you have trouble with one of the binary packages, file an issue [here][gh-issues].

If you want to provide additional packaging scripts for your OS/distro, please file a pull request.


Install scripts
---------------

For POSIX based systems (so far Linux and MacOS) we provide a simple bash script for installing the ondevice commandline
client.

```bash
curl -sSL https://repo.ondevice.io/install.sh | sudo bash -
```




Debian repository
-----------------

We provide a `.deb` repository for Debian based Linux distributions (Debian/Ubuntu/Raspbian/Mint/...).

We strongly recommend using these prepackaged debian packages on those systems (since they'll get updated along with your other software and also include the `ondevice-daemon` package for added convenience).

The simplest way to use them is by using the aforementioned install script.

Alternatively, you can manually set things up using:

```bash
echo "deb http://repo.ondevice.io/debian stable main" | sudo tee /etc/apt/sources.list.d/ondevice.list
curl https://repo.ondevice.io/repo.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install ondevice

# and if you want to autostart `ondevice daemon`:
sudo apt-get install ondevice-daemon
```


Note: Back when we used the python-based prototype client, we had distinct repositories for a lot of different distributions/releases (we needed those since each `.deb` was only compatible to a certain arch+python-release combo).  
These will be kept up to date for now, but will eventually be deactivated in favor of the `stable` repository.


[docker]: https://docker.com/
[gh-issues]: https://github.com/ondevice/ondevice-packaging/issues
