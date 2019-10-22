#/usr/bin/bash

sudo -E apt update
sudo -E apt install -y curl pkg-config git fish

# install Rust and tools
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install exa ripgrep starship cargo-update

# fish shell setting
git clone --recursive https://github.com/ramnext/dotfiles.git $HOME/dotfiles
if [ -d $HOME/.config/fish ]; then
    mkdir -p $HOME/.config/fish
    ln -sfv $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
else
    echo "fish shell config is already exists!!"
fi
