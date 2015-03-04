#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update >/dev/null 2>&1
brew install htop unrar tree ctags ssh-copy-id wget coreutils git-flow vim ffmpeg

sudo gem update --system >/dev/null 2>&1
sudo gem install lolcat

easy_install pip
sudo pip install ipython jedi virtualenv virtualenvwrapper pyflakes pylint autopep8 shadowsocks  gevent pyperclip pbkdf2 Pygments pythonpy unp

curl -L http://install.ohmyz.sh | sh

ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.inputrc ~/.inputrc
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.pip ~/.pip
ln -s `pwd`/.vim ~/.vim
sudo ln -s `pwd`/wgetpaste /bin/wgetpaste
