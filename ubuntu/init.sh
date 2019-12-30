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
    silversearcher-ag \
    lastpass-cli \
    tmux \
    tig \
    golang-go \
    python3.8 \
    python3-pip \
    python3.8-venv \
    fish
printf "***** %s end. *****\n\n" "[apt] package install"

# dotfiles clone from github.com
#
git clone --recursive https://github.com/ramnext/dotfiles.git $HOME/dotfiles
printf "***** %s end. *****\n\n" "[dotfiles] clone"

# install python tools
#
pip3 install -U pip
pip3 install -U --user \
	flake8 \
	jedi \
	black \
	neovim
printf "***** %s end. *****\n\n" "[python tools] install"

# install fzf
#
if [ -d $HOME/.fzf ]; then
    echo "fzf is already installed!!"
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    $HOME/.fzf/install
fi
printf "***** %s end. *****\n\n" "[fzf] install"

# install Rust and tools
#
if [ -f $HOME/.cargo/env ]; then
    echo "Rust is already installed!!"
else
    curl -fsSL https://starship.rs/install.sh | bash
fi
source $HOME/.cargo/env
cargo install \
	exa \
	ripgrep \
	starship \
	cargo-update
ln -sfv $HOME/dotfiles/starship/starship.toml  $HOME/.config/starship.toml
printf "***** %s end. *****\n\n" "[Rust and tools] install"

# fish shell setting
#
if [ ! -d $HOME/.config/fish ]; then
    mkdir -p $HOME/.config/fish
else
    echo "fish shell config is already exists!!"
fi
ln -sfv $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -sfv $HOME/dotfiles/fish/fishfile $HOME/.config/fish/fishfile
ln -sfv $HOME/dotfiles/fish/functions/fish_user_key_bindings.fish $HOME/.config/fish/functions/fish_user_key_bindings.fish
ln -sfv $HOME/dotfiles/fish/functions/cdl.fish $HOME/.config/fish/functions/cdl.fish
ln -sfv $HOME/dotfiles/fish/functions/tree.fish $HOME/.config/fish/functions/tree.fish
ln -sfv $HOME/dotfiles/fish/functions/fco.fish $HOME/.config/fish/functions/fco.fish
ln -sfv $HOME/dotfiles/fish/functions/fcoc.fish $HOME/.config/fish/functions/fcoc.fish
ln -sfv $HOME/dotfiles/fish/functions/fpass.fish $HOME/.config/fish/functions/fpass.fish
ln -sfv $HOME/dotfiles/fish/functions/fssh.fish $HOME/.config/fish/functions/fssh.fish
ln -sfv $HOME/dotfiles/fish/functions/fts.fish $HOME/.config/fish/functions/fts.fish
ln -sfv $HOME/dotfiles/fish/functions/fzf-bcd-widget.fish $HOME/.config/fish/functions/fzf-bcd-widget.fish
ln -sfv $HOME/dotfiles/fish/functions/fzf-cdhist-widget.fish $HOME/.config/fish/functions/fzf-cdhist-widget.fish
ln -sfv $HOME/dotfiles/fish/functions/fzf-complete.fish $HOME/.config/fish/functions/fzf-complete.fish
printf "***** %s end. *****\n\n" "[fish shell tools] install"

# install golang tools
#
(type ghq) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "ghq is already exists!!"
else
    go get github.com/motemen/ghq
fi
printf "***** %s end. *****\n\n" "[golang] install"

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
printf "***** %s end. *****\n\n" "[docker] install"

# install docker-compose
#
(type docker-compose) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "docker-compose is already exists!!"
else
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi
printf "***** %s end. *****\n\n" "[docker-compose] install"

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
printf "***** %s end. *****\n\n" "[kubernetes] install"

# install kind
#
(type kind) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "kind is already exists!!"
else
    sudo curl -L "https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64" -o /usr/local/bin/kind
    sudo chmod +x /usr/local/bin/kind
fi
printf "***** %s end. *****\n\n" "[kind] install"

