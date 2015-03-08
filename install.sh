#!/bin/bash
echo "=> chown /usr/local"
sudo chown -R `whoami` /usr/local

echo "=> install homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null

echo "=> homebrew update"
brew update &>/dev/null
sudo gem update --system &>/dev/null
echo "=> install bins"
brew install htop npm unrar tree ctags ssh-copy-id wget coreutils git-flow vim ffmpeg figlet gist &>/dev/null
sudo gem install lolcat &>/dev/null
sudo npm install -g bower &>/dev/null

echo "=> install python modules"
sudo easy_install pip &>/dev/null
sudo pip install ipython jedi virtualenv virtualenvwrapper pyflakes pylint autopep8 shadowsocks  gevent pyperclip pbkdf2 Pygments pythonpy unp simpletornadoserver &>/dev/null

echo "=> install omyzsh"
curl -L http://install.ohmyz.sh | sh

echo "=> forbid .DS_Store"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

echo "=> make softlinks"

if [ -d ~/.pip ]; then
    rm -rf ~/.pip
fi
ln -s `pwd`/.pip ~/.pip

if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
ln -s `pwd`/.vim ~/.vim

if [ -f ~/.gitconfig ]; then
    rm -rf ~/.gitconfig
fi
ln -s `pwd`/.gitconfig ~/.gitconfig

if [ -f ~/.inputrc ]; then
    rm -rf ~/.inputrc
fi
ln -s `pwd`/.inputrc ~/.inputrc

if [ -f ~/.vimrc ]; then
    rm -rf ~/.vimrc
fi
ln -s `pwd`/.vimrc ~/.vimrc

if [ -f ~/.zshrc ]; then
    rm -rf ~/.zshrc
fi
ln -s `pwd`/.zshrc ~/.zshrc
