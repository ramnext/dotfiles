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
sudo -E add-apt-repository ppa:apt-fast/stable
sudo -E apt update
sudo -E apt install -y \
    apt-fast \
    git \
    neovim \
    bat \
    ctags \
    silversearcher-ag \
    lastpass-cli \
    tmux \
    tig \
    golang-go \
    python3-dev \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \
    fish \
    tree \
    latexpdf \
    dvipng
sudo -E apt-fast install -y \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-japanese \
    texlive-lang-cjkapt-fast \
    texlive-extra-utils
printf "***** %s end. *****\n\n" "[apt] package install"

# dotfiles clone from github.com
#
git clone --recursive https://github.com/ramnext/dotfiles.git $HOME/dotfiles
printf "***** %s end. *****\n\n" "[dotfiles] clone"

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

# fish shell settings.
#
if [ ! -d $HOME/.config/fish ]; then
    mkdir -p $HOME/.config/fish
    chsh -s /usr/bin/fish
else
    echo "fish shell config is already exists!!"
fi
ln -sfv $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -sfv $HOME/dotfiles/fish/venv.fish $HOME/.config/fish/venv.fish
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
export GOPATH=$HOME/go
# ghq that github repository manager.
(type ghq) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "ghq is already exists!!"
else
    go get -d github.com/motemen/ghq
    cd $GOPATH/src/github.com/motemen/ghq
    make install
fi
# lemonade that remote clipboard sharing application.
# https://github.com/lemonade-command/lemonade
(type lemonade) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "lemonade is already exists!!"
else
    go get -d github.com/lemonade-command/lemonade
    cd $GOPATH/src/github.com/lemonade-command/lemonade/
    make install
fi
printf "***** %s end. *****\n\n" "[golang tools] install"

# anyenv settings.
#
if [ ! -d $HOME/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
	mkdir -p $HOME/.anyenv/plugins
	git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git $HOME/.anyenv/plugins/anyenv-git
fi
$HOME/.anyenv/bin/anyenv init
(type anyenv) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "anyenv is already exists!!"
fi
anyenv install --init
printf "***** %s end. *****\n\n" "[anyenv] install"

# install python tools
#
# if broken pip, Run follow command.
# curl -kL https://bootstrap.pypa.io/get-pip.py | sudo python3

# pyenv settings.
#
(type pyenv) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "pyenv is already exists!!"
else
    anyenv install pyenv
    export PATH=$HOME/.anyenv/envs/pyenv/bin:$PATH
fi
version="$(pyenv versions | grep -v system)" 2> /dev/null
if [ -z "$version" ]; then
    pyenv install 3.8.2
    pyenv global 3.8.2
fi
python -m pip install --upgrade --user \
	pip \
	flake8 \
	jedi \
	black \
	pynvim
printf "***** %s end. *****\n\n" "[python tools] install"


# nodenv settings.
#
(type nodenv) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "nodenv is already exists!!"
else
    anyenv install nodenv
    export PATH=$HOME/.anyenv/envs/nodenv/bin:$PATH
fi
version="$(nodenv versions | grep -v system)" 2> /dev/null
if [ -z "$version" ]; then
    nodenv install 13.11.0
    nodenv global 13.11.0
fi
cd $HOME; npm install -g yarn; yarn add neovim

# neovim settings.
#
if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "neovim config is already exists!!"
fi
#@ ln -sfv $HOME/dotfiles/neovim/init.vim $HOME/.config/nvim/init.vim     # Use vim-plug
ln -sfv $HOME/dotfiles/neovimdein/init.vim $HOME/.config/nvim/init.vim    # Use dein
ln -sfv $HOME/dotfiles/neovimdein/dein.toml $HOME/.config/nvim/dein.toml
ln -sfv $HOME/dotfiles/neovim/coc-settings.json   $HOME/.config/coc-settings.json
printf "***** %s end. *****\n\n" "[neovim] install"

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
