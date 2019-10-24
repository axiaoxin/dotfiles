/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

curl -L http://install.ohmyz.sh | sh

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
#install xcode and run install components
brew install fortune
brew install cowsay
brew install pyenv
# set global python 3
sudo easy_install pip
sudo pip install --upgrade setuptools
brew install lolcat
sudo pip install virtualenv virtualenvwrapper thefuck isort yapf pylint flake8 autopep8
brew install gshuf
brew install coreutils
brew install redis
#install mysql
brew install mycli
brew cask install switchhosts
brew install cmake macvim pygments global
# .zhsrc
# download app, fonts
# install go
# install iterm2
gem install iStats
