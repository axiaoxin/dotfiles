# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/axiaoxin/.oh-my-zsh"
export ZSH=$HOME/.oh-my-zsh

ulimit -n 65536

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME_RANDOM_CANDIDATES=(
    "3den"
    "Soliah"
    "af-magic"
    "afowler"
    "alanpeabody"
    "aussiegeek"
    "bira"
    "blinks"
    "candy"
    "crcandy"
    "crunch"
    "dpoggi"
    "dst"
    "dstufft"
    "eastwood"
    "flazz"
    "fox"
    "frisk"
    "frontcube"
    "gallois"
    "gentoo"
    "gnzh"
    "itchy"
    "josh"
    "juanghurtado"
    "lambda"
    "macovsky"
    "mh"
    "mira"
    "mortalscumbag"
    "murilasso"
    "muse"
    "pmcgee"
    "pygmalion-virtualenv"
    "pygmalion"
    "re5et"
    "rkj-repos"
    "simple"
    "steeef"
    "tjkirch"
    "tjkirch_mod"
    "tonotdo"
    "xiong-chiamiov-plus"
    "ys"
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    cp  # 提供一个 cpv 命令，这个命令使用 rsync 实现带进度条的复制功能。
    extract  # 提供一个 extract 命令，以及它的别名 x。功能是：一！键！解！压！
    git  # 定义了有关 git 的 alias。常用的有gaa = git add --all; gcmsg = git commit -m; ga = git add; gst = git status; gp = git push
    gitignore  # 提供一条 gi 命令，用来查询 gitignore 模板。比如你新建了一个 python 项目，就可以用: gi python > .gitignore
    git-open  # 提供一个 git-open 命令，在浏览器中打开当前所在 git 项目的远程仓库地址。
    history-substring-search  # 历史查找
    last-working-dir
    safe-paste  # 当你往 zsh 粘贴脚本时，它不会被立刻运行。
    colored-man-pages  # 带颜色的 man 命令
    zsh-syntax-highlighting  # 命令高亮
    zsh-autosuggestions  # 自动补全
    sudo  # 按两次esc在前面添加sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/usr/local/bin/brew:$PATH"
# HomeBrew END


# Alias
alias rm="trash"
alias ls="lsd"
alias ll="lsd -lh"
alias cat="bat"
alias df="duf"
alias tree="broot"


# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE=
# golang END

# gvm
[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"
# gvm END

# the fuck
eval $(thefuck --alias)
# the fuck END

# cowsay at last
say_or_think=(cowsay cowthink)
say_or_think=`echo $say_or_think[(($RANDOM % ${#say_or_think[@]}))+1]`
eyes=(-b -d -y)
eye=`echo $eyes[(($RANDOM % ${#eyes[@]}))+1]`
cowfile=`cowsay -l| sed '1d;' | tr ' ' '\n'| gshuf -n 1`
fortune | $say_or_think -f $cowfile $eye | lolcat # -a -s 150 -p 1.5 -F 1 -d 10 -f;
# cowsay END
