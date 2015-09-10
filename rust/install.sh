#! /bin/bash

# exit if a command fails
set -e

# intialize environment variables used by the rust install script
export SHELL=/bin/bash

# prepare dirs to share with host
mkdir /source
mkdir /usr/local/src/rust

# install dependencies
apt-get update
apt-get install -y curl file git gcc

# install rust and cargo (stable)
curl -sSL https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo -y

# remove the local rust and cargo documentation
rm -rf /usr/local/share/doc/rust /usr/local/share/doc/cargo

# download the rust manifest and determine the current stable version
_manifest=$(curl -sSL http://static-rust-lang-org.s3-website-us-west-1.amazonaws.com/dist/channel-rust-stable)
_regex="^rust-([0-9]*\.[0-9]*\.[0-9]*)-.*"
[[ $_manifest =~ $_regex ]]
_version="${BASH_REMATCH[1]}"

# download rust source code for use by dev tools
echo "Downloading Rust source code..."
curl -SL https://static.rust-lang.org/dist/rustc-$_version-src.tar.gz | tar xz -C /tmp

# remove unnecessary cruft from the source code
mv /tmp/rustc-$_version/src /usr/local/src/rust
rm -rf /tmp/*

# set environment variables
export RUST_SRC_PATH=/usr/local/src/rust/src

# download racer
echo "Downloading Racer..."
git clone --progress https://github.com/phildawes/racer.git

# build racer
echo "Building Racer..."
cd racer && sync && cargo build --verbose --release
mv target/release/racer /usr/bin && cd /
rm -rf racer

echo "Testing Racer..."
racer complete std::io::B

# cleanup package manager
apt-get remove --auto-remove --purge -y curl file git
apt-get autoclean
apt-get clean
rm -rf /var/lib/apt/lists/*
