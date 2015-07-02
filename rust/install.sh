#! /bin/bash

# exit if a command fails
set -e

# install curl (needed to install rust)
apt-get update && apt-get install -y curl

# install rust and cargo (stable)
curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo -y

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir to share with host
mkdir /source
