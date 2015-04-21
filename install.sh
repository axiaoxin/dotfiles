#!/bin/bash
echo "=> chown /usr/local"
sudo chown -R `whoami` /usr/local

echo "=> install homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null

echo "=> homebrew update"
brew update &>/dev/null
sudo gem update --system &>/dev/null

echo "=> install bins"
brew install vim --with-lua
brew install git htop npm unrar tree ssh-copy-id wget coreutils ffmpeg figlet gist ctags &>/dev/null
sudo gem install lolcat &>/dev/null
sudo npm install -g bower &>/dev/null
#npm for vim
sudo npm -g install instant-markdown-d

echo "=> install python modules"
sudo easy_install pip &>/dev/null
sudo pip install ipython virtualenvwrapper Pygments pythonpy unp simpletornadoserver &>/dev/null
#pip for vim
sudo pip install isort jedi yapf flake8


echo "=> install omyzsh"
curl -L http://install.ohmyz.sh | sh

echo "=> forbid .DS_Store"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

echo "=> make softlinks"

if [ -d ~/.pip ]; then
    rm -rf ~/.pip
fi
ln -s `pwd`/.pip ~/.pip

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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
