Packaging scripts for the ondevice client on debian based systems
====================

This repository contains the official build-scripts for packages published at https://repo.ondevice.io

The packages are built inside docker containers using [dh-virtualenv][0].

The easiest way to install the packages is `install_deb.sh`:

    curl -sSL https://repo.ondevice.io/install_deb.sh | sudo bash -e


Officially supported distro releases:
-------------------------------------

older releases (marked with an asterisk) won't be updated that often

### debian/raspbian (amd64, i386)
- stretch (testing; python3.5)
- jessie (stable; python3.4)
- wheezy (oldstable; python2.7) *
- squeeze (python2.6) *

### ubuntu (amd64, i386)
- yakkety (python3.5)
- xenial (python3.5)
- trusty (python3.4)
- precise (python2.7) *
- lucid (python2.6) *

### raspbian (armhf)
- jessie

Notes:
- If `install_deb.sh` fails to autodetect your distro/release, you can specify them yourself using the `DISTRO` and `CODENAME` environment variables (for `DISTRO` pick `ubuntu` or `debian`, for `CODENAME` one of the supported ones matching your distro and having the same python version)
- You can of course install `ondevice` on debian/ubuntu using Python3's `pip`, but we advise against it (`pip` sometimes messes with the python packages installed using `apt-get`)
- There are plans to add an `ondevice-daemon` package that will take care of autostarting a system-wide `ondevice daemon` instance.
- dh-virtualenv sadly makes the resulting packages architecture and python-version dependent (hence the `-pythonX.Y` suffix on package names).  
  If you know a genius way of avoiding that, let us know :)


[0]: https://github.com/spotify/dh-virtualenv
