# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/sagarkishore/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

alias ca="conda activate"
alias runs="python manage.py runserver"
alias mm="python manage.py makemigrations"
alias mig="python manage.py migrate"
alias mt="python manage.py test"
alias pip="pip3"
alias v="nvim"
# alias vim="nvim"
alias sv="sudo nvim"
alias zrc="v ~/.zshrc"
alias vrc="v ~/.vimrc"
alias zclrs="for code ({000..255}) print -P -- '$code: %F{$code}This is how your text would look like%f'"
export TERM=xterm-256color
##########################################################################################################
#					POWERLEVEL9K CONFIGURATIONS
##########################################################################################################

DEFAULT_FOREGROUND="none" DEFAULT_BACKGROUND="none"
DEFAULT_COLOR=$DEFAULT_FOREGROUND
CONTEXT_FOREGROUND=015
DIR_FOREGROUND=004
VCS_FOREGROUND="none"
PYENV_FOREGROUND=005

# DEFAULT_FOREGROUND=003 DEFAULT_BACKGROUND="none"
# DEFAULT_COLOR=$DEFAULT_FOREGROUND
# CONTEXT_FOREGROUND=003
# DIR_FOREGROUND=033
# VCS_FOREGROUND=003
# PYENV_FOREGROUND=009


# powerlevel9k prompt theme
#DEFAULT_USER=$USER

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir ssh anaconda virtualenv)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh root_indicator dir_writable dir)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time)

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=' '
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' | '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' | '
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''


POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false

POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_ALWAYS_SHOW_USER=true

POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 %m"

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="$CONTEXT_FOREGROUND"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="$CONTEXT_FOREGROUND"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"


POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❱❱❱"

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{003}❱%F{003}❱%F{003}❱"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=010
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=011
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=012
POWERLEVEL9K_HIDE_BRANCH_ICON=true


POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_HOME_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DIR_FOREGROUND"

POWERLEVEL9K_ANACONDA_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_ANACONDA_FOREGROUND="$PYENV_FOREGROUND"

POWERLEVEL9K_VIRTUALENV_FOREGROUND=005
POWERLEVEL9K_VIRTUALENV_BACKGROUND="none"

POWERLEVEL9K_STATUS_OK_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_STATUS_ERROR_FOREGROUND=001
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_HISTORY_FOREGROUND="$DEFAULT_FOREGROUND"

POWERLEVEL9K_TIME_FORMAT="%D{%T}"
POWERLEVEL9K_TIME_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"


POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_EXECUTION_TIME_ICON="\u23F1"

#POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_FOREGROUND"

POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_USER_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="magenta"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
#POWERLEVEL9K_ROOT_ICON=$'\uFF03' # ＃
POWERLEVEL9K_ROOT_ICON=$'\uF198'  # 

POWERLEVEL9K_SSH_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_SSH_FOREGROUND="yellow"
POWERLEVEL9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_SSH_ICON="\uF489"  # 

POWERLEVEL9K_HOST_LOCAL_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_HOST_REMOTE_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_HOST_ICON_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_HOST_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_HOST_ICON="\uF109" # 

POWERLEVEL9K_OS_ICON_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND_COLOR="$DEFAULT_BACKGROUND"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="$DEFAULT_BACKGROUND"



##########################################################################################################

# Easily switch primary foreground/background colors
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  virtualenv
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#         source /etc/profile.d/vte.sh
# fi

# export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
 
# source ~/.purepower
# eval $(dircolors -b $HOME/.dircolors)



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sagarkishore/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sagarkishore/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sagarkishore/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sagarkishore/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

