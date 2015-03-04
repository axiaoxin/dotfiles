#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

curl -L http://install.ohmyz.sh | sh

brew update
brew install htop unrar tree ctags ssh-copy-id wget coreutils git-flow vim ffmpeg

sudo gem update --system
sudo gem install lolcat

easy_install pip
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
sudo pip install ipython jedi virtualenv virtualenvwrapper pyflakes pylint autopep8 shadowsocks  gevent pyperclip pbkdf2 Pygments pythonpy unp
