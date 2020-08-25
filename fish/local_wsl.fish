# proxy setting
set -x http_proxy 'http://z1h6022:ki__CP+7@ctcpro.ctc-g.co.jp:8080'
set -x https_proxy $http_proxy
set -x no_proxy '127.0.0.1,localhost,10.213.194.96,10.213.194.105,10.213.194.107,192.168.65.*'
set -x http_proxy_user 'z1h6022'
set -x http_proxy_pass 'ki__CP+7'

# docker setting
set -x DOCKER_HOST 'tcp://localhost:2375'

# shared library
set -x LIBCLANG_PATH "$LIBCLANG_PATH:/usr/lib/x86_64-linux-gnu/"

# for Win10 17.09. Win10 18.03 later can delete
#del status --is-login; and sudo mount --bind /mnt/c /c

## for neovim
alias vi='~/squashfs-root/usr/bin/nvim'
