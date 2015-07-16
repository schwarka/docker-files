#! /bin/bash

# exit if a command fails
set -e

# intialize environment variables used by the rust install script
export SHELL=/bin/bash

# prepare dirs to share with host
mkdir /source
mkdir /rust-src

# install curl (needed to install rust)
apt-get update && apt-get install -y curl file

# install rust and cargo (stable)
curl -sSL https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo -y

# remove the local rust and cargo documentation
rm -rf /usr/local/share/doc/rust/ /usr/local/share/doc/cargo/

# download the rust manifest and determine the current stable version
_manifest=$(curl -sSL http://static-rust-lang-org.s3-website-us-west-1.amazonaws.com/dist/channel-rust-stable)
_regex="^rust-([0-9]*\.[0-9]*\.[0-9]*)-.*"
[[ $_manifest =~ $_regex ]]
_version="${BASH_REMATCH[1]}"

# download rust source code for use by dev tools
curl -sSL https://static.rust-lang.org/dist/rustc-$_version-src.tar.gz | tar xz -C /tmp

# remove unnecessary cruft from the source code
mv /tmp/rustc-$_version/src /rust-source-storage
rm -rf /tmp/*

# cleanup package manager
apt-get remove --purge -y curl file $(apt-mark showauto) && apt-get autoclean && apt-get clean && rm -rf /var/lib/apt/lists/*
