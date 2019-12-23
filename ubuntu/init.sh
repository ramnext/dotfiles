#!/usr/bin/bash

sudo -E apt install -y ca-certificates
sudo -E apt update
sudo -E apt install -y \
    libssl-dev \
    curl \
    pkg-config \
    net-tools \
    apt-transport-https \
    gnupg-agent \
    software-properties-common
sudo -E apt install -y \
    git \
    neovim \
    bat \
    lastpass-cli \
    tmux \
    tig \
    golang-go \
    python3.8 \
    python3.8-venv \
    fish

# install fzf
#
if [ -d $HOME/.fzf ]; then
    echo "fzf is already installed!!"
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    $HOME/.fzf/install
fi

# install Rust and tools
#
if [ -f $HOME/.cargo/env ]; then
    echo "Rust is already installed!!"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
source $HOME/.cargo/env
cargo install \
	exa \
	ripgrep \
	starship \
	cargo-update

# fish shell setting
#
git clone --recursive https://github.com/ramnext/dotfiles.git $HOME/dotfiles
if [ ! -d $HOME/.config/fish ]; then
    mkdir -p $HOME/.config/fish
else
    echo "fish shell config is already exists!!"
fi
ln -sfv $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -sfv $HOME/dotfiles/fish/fishfile $HOME/.config/fish/fishfile
ln -sfv $HOME/dotfiles/fish/functions/fish_user_key_bindings.fish $HOME/.config/fish/functions/fish_user_key_bindings.fish
ln -sfv $HOME/dotfiles/fish/functions/fco.fish $HOME/.config/fish/functions/fco.fish
ln -sfv $HOME/dotfiles/fish/functions/fcoc.fish $HOME/.config/fish/functions/fcoc.fish
ln -sfv $HOME/dotfiles/fish/functions/fpass.fish $HOME/.config/fish/functions/fpass.fish
ln -sfv $HOME/dotfiles/fish/functions/fssh.fish $HOME/.config/fish/functions/fssh.fish
ln -sfv $HOME/dotfiles/fish/functions/fpass.fish $HOME/.config/fish/functions/fpass.fish
ln -sfv $HOME/dotfiles/fish/functions/fcoc.fish $HOME/.config/fish/functions/fcoc.fish
ln -sfv $HOME/dotfiles/fish/functions/fco.fish $HOME/.config/fish/functions/fco.fish
ln -sfv $HOME/dotfiles/fish/functions/fzf-complete.fish $HOME/.config/fish/functions/fzf-complete.fish

# install golang tools
#
(type ghq) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "ghq is already exists!!"
else
    go get github.com/motemen/ghq
fi

# install Docker
#
(type docker) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "docker is already exists!!"
else
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo -E apt update
    sudo -E apt install -y \
        docker-ce docker-ce-cli containerd.io
    sudo -E docker run hello-world
    sudo usermod -a -G docker $USER
fi
# install docker-compose
(type docker-compose) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "docker-compose is already exists!!"
else
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi
# install Kubernetes
#
(type kubectl) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Kubernetes is already exists!!"
else
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo -E cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
    sudo -E apt update
    sudo -E apt install -y \
        kubelet kubeadm kubectl
    sudo apt-mark hold kubelet kubeadm kubectl
fi
# install kind
#
(type kind) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "kind is already exists!!"
else
    sudo curl -L "https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64" -o /usr/local/bin/kind
    sudo chmod +x /usr/local/bin/kind
fi
