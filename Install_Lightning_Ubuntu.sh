#!/bin/sh

# Install updates
sudo apt-get update
sudo apt-get upgrade -y

# Install dependencies for Bitcoin lightning
sudo apt-get install -y autoconf automake build-essential git libtool libgmp-dev libsqlite3-dev python python3 net-tools tmux

# Installing bitcoind from the Bitcoin PPA
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y bitcoind

# Cloning the lightnignd repository and compiling
mkdir builds && cd builds
git clone https://github.com/ElementsProject/lightning.git
cd lightning
make

# Running bitcoind, lightningd, and lightning-cli to test correct installation
bitcoind --daemon
./lightningd/lightningd --network bitcoin --log-level debug



