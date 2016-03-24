#!/bin/bash
echo "=> chown /usr/local"
sudo chown -R `whoami` /usr/local

echo "=> install homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null

echo "=> install nvm"
curl https://raw.githubusercontent.com/cnpm/nvm/master/install.sh | bash &>/dev/null

echo "=> homebrew update"
brew update &>/dev/null
sudo gem update --system &>/dev/null

echo "=> install bins"
brew install caskroom/cask/brew-cask
brew install vim --with-lua
brew install git git-flow htop npm unrar tree ssh-copy-id wget coreutils ffmpeg figlet gist ctags cheat the_silver_searcher &>/dev/null
sudo gem install lolcat rename &>/dev/null
sudo npm install -g bower &>/dev/null
sudo npm install -g ttyrec ttycast &>/dev/null
sudo npm install -g how2 &>/dev/null
#npm for vim
sudo npm -g install instant-markdown-d
sudo npm install -g jshint

echo "=> install python modules"
sudo easy_install pip &>/dev/null
sudo pip install -U ptpython ipython virtualenvwrapper Pygments pythonpy unp simpletornadoserver thefuck joe polysh&>/dev/null
#pip for vim
sudo pip install -U isort jedi yapf flake8 autopep8


echo "=> install omyzsh"
curl -L http://install.ohmyz.sh | sh

echo "=> com.apple cmds"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.TextEdit RichText -int 0
hash tmutil &> /dev/null && sudo tmutil disablelocal
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

echo "=> make softlinks"

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

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
ln -s `pwd`/flake8 ~/.config
