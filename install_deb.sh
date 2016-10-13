#!/bin/bash -e
#
# installs the ondevice client on debian based systems
#

DEBIAN_CODENAMES="squeeze wheezy jessie"
UBUNTU_CODENAMES="precise trusty xenial"

# prints the first input path that exists (or exits 1 on error)
_findCmd() {
	while (( "$#" )); do
		p="$(command -v "$1" 2>/dev/null)"
		if [ -n "$p" ]; then
			echo "$p"
			return 0
		fi
		shift
	done
	return 1
}

# prints the distribution name as listed in /etc/os-release
_getDistro() {
	grep '^ID=' /etc/os-release|cut -d= -f2	
}

# returns 0 if the given command was found
_hasCmd() {
	command -v "$1" &>/dev/null
}

# returns 0 if the given package name was found using apt-cache
_aptHasPkg() {
	[ "$(apt-cache pkgnames "$pkgName" |grep "^$pkgName$"|wc -l)" -eq 1 ]
}


_detectDistro() {
	distro="$(_getDistro)"
	if [ -n "$DISTRO" ]; then
		return 0 # already detected
	elif [ debian == "$distro" ]; then
		DISTRO=debian
	elif [ ubuntu == "$distro" ]; then
		DISTRO=ubuntu
	else
		echo "Failed to detect distribution, aborting (you can set the DISTRO variable if you know what you're doing)" >&2
		exit 1
	fi

	echo "-- detected DISTRO: '$DISTRO'" >&2
}

_detectCodename() {
	_detectDistro
	if [ -n "$CODENAME" ]; then
		return 0 # already known
	elif [ ubuntu == "$DISTRO" ]; then
		# we can use /etc/lsb-release
		codename="$(grep DISTRIB_CODENAME= /etc/lsb-release|cut -d= -f2)"
		if echo "$UBUNTU_CODENAMES"|tr ' ' '\n'|grep -q "^$codename$"; then
			CODENAME="$codename"
		else
			echo "Unsupported Ubuntu codename: '$codename', aborting (set the CODENAME variable to override autodetect)" >&2
			exit 1
		fi
	elif [ debian == "$DISTRO" ]; then
		# fetch the distribution from /etc/apt/sources.list
		for codename in $DEBIAN_CODENAMES; do
			if grep '^deb ' /etc/apt/sources.list|cut '-d ' -f3|grep -q "^$codename$"; then
				CODENAME="$codename"
				break
			fi
		done
	else
		echo "Failed to detect codename, aborting (set the CODENAME variable to override autodetect)" >2
		exit 1
	fi

	echo "-- detected CODENAME: '$CODENAME'" >&2
}

#_detectArchitecture() {
#	if [ -n "$ARCH" ]; then
#		return 0 # already known
#	fi
#
#	ARCH="$(dpkg --print-architecture)"
#	echo "-- detected ARCHITECTURE: '$ARCH'" >&2
#}

addAptKey() {
	curl http://repo.ondevice.io/ondevice.key | apt-key add -
}

addAptRepo() {
	REPO_FILE=/etc/apt/sources.list.d/ondevice.list
	if [ -f "$REPO_FILE" ]; then
		echo "-- '$REPO_FILE' already exists, won't overwrite" >&2
		return 0
	fi

	echo "-- writing '$REPO_FILE'" >&2
	echo "deb http://repo.ondevice.io/$DISTRO $CODENAME main" > "$REPO_FILE"
}

installOndevice() {
	echo '-- installing ondevice package' >&2
	apt-get update && apt-get install -y ondevice
}

# fail early if we can't figure out the distro details
_detectDistro
_detectCodename
#_detectArchitecture

addAptKey
addAptRepo

installOndevice
