#!/bin/bash

echo "=> install homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null

echo "=> homebrew update"
brew update &>/dev/null
echo "=> install bins by homebrew"
brew install htop unrar tree ctags ssh-copy-id wget coreutils git-flow vim ffmpeg figlet gist

echo "=> gem update"
sudo gem update --system &>/dev/null
echo "=> install lolcat"
sudo gem install lolcat

echo "=> install python modules"
easy_install pip
sudo pip install ipython jedi virtualenv virtualenvwrapper pyflakes pylint autopep8 shadowsocks  gevent pyperclip pbkdf2 Pygments pythonpy unp simpletornadoserver &>/dev/null

echo "=> install omyzsh"
curl -L http://install.ohmyz.sh | sh

echo "=> make softlinks"
ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.inputrc ~/.inputrc
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.pip ~/.pip
ln -s `pwd`/.vim ~/.vim
