#!/usr/bin/bash

# pyenv settings.
#
(type pyenv) > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "pyenv is already exists!!"
else
    anyenv install pyenv
    export PATH=$HOME/.anyenv/envs/pyenv/bin:$PATH
fi
echo `pyenv versions | grep -v system`
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
