#!/bin/bash

echo "
=========================
update os.
========================="
sudo apt update && \
sudo apt list --upgradable && \
sudo apt upgrade

echo "
=========================
update rust plugins.
========================="
rustup update
cargo install-update -a

echo "
=========================
update git repositories.
========================="
ghq list | ghq get -u

echo "
=========================
update anyenv plugins.
========================="
anyenv update
