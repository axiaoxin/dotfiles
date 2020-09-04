# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

ZSH_THEME_RANDOM_CANDIDATES=( "3den" "Soliah" "af-magic" "afowler" "alanpeabody" "aussiegeek" "bira" "blinks" "candy" "crcandy" "crunch" "dpoggi" "dst" "dstufft" "eastwood" "flazz" "fox" "frisk" "frontcube" "gallois" "gentoo" "gnzh" "itchy" "jaischeema" "josh" "juanghurtado" "lambda" "macovsky" "mh" "mira" "mortalscumbag" "murilasso" "muse" "pmcgee" "pygmalion-virtualenv" "pygmalion" "re5et" "rkj-repos" "simple" "steeef" "tjkirch" "tjkirch_mod" "tonotdo" "xiong-chiamiov-plus" "ys")


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi=vim
alias kat="pygmentize -O encoding=UTF-8 -g"
# Copy my public key to the pasteboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias pyserver="python -m SimpleTornadoServer"
alias ftpon="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
alias ftpoff="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias ptpython='ptpython --vi'
alias ipython='ptipython --vi'
alias ttyserver='rm /tmp/outfile.tty &>/dev/null;rm /tmp/ttycast &>/dev/null;ttyreccast /tmp/outfile.tty'
alias ttyclient='reset && ttyrec /tmp/ttycast'
alias ttyclear='rm /tmp/outfile.tty;rm /tmp/ttycast'
alias ttyopen='open http://`ipconfig getifaddr en0`:13377'
alias ttycopy='echo "http://`ipconfig getifaddr en0`:13377" | pbcopy'
alias video2gif='function _video2gif() {ffmpeg -i $1 -pix_fmt rgb24 -f gif - | gifsicle > $2;}; _video2gif'
# ffmpeg -i input.mp4 -s 600x400 -pix_fmt rgb24 -f gif - | gifsicle --optimize=3 > output.gif
alias tq='function tianqi() {curl wttr.in/$1}; tianqi'
# curl -s wttr.in/shanghai  | grep "Weather for" -A 6 | sed -E "s/"$'\E'"\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g"
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias weibovideo='function wv() {curl -O `curl -XPOST http://weibovideo.com/controller.php -d weibourl=$1`}; wv'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search virtualenvwrapper last-working-dir)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/openresty/nginx/sbin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# cowsay
say_or_think=(cowsay cowthink)
say_or_think=`echo $say_or_think[(($RANDOM % ${#say_or_think[@]}))+1]`
eyes=(-b -d -y)
eye=`echo $eyes[(($RANDOM % ${#eyes[@]}))+1]`
cowfile=`cowsay -l| sed '1d;' | tr ' ' '\n'| gshuf -n 1`
fortune | $say_or_think -f $cowfile $eye | lolcat# -a -s 150 -p 1.5 -F 1 -d 10 -f;

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

###nvm
source ~/.nvm/nvm.sh

# go环境
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
