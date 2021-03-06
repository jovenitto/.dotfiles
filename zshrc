export EDITOR="vim"

echo
echo Setting up the environment.
echo Synchronizing .dotfiles...

#update .dotfiles (git pull)
cd ~/.dotfiles
git pull > /dev/null 
cd ~

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="jovenitto"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Disable update prompt (auto update without notification)
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux common-aliases lol nyan sublime systemd wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ppereira/.gem/ruby/2.1.0/bin"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

setopt auto_cd                  # if command is a path, cd into it
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus



# jovenitto.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then


# display exitcode on the right when >0
    return_code="%(?.%{$fg[green]%}[✔]%{$reset_color%}.%{$fg[red]%}[✗]%{$reset_color%})"
    

#    user_host="%(%m=bullfrog.%{$fg[green]%}✔%{$reset_color%}.%{$fg[red]%}%? ✗i%{$reset_color%})"
    if [[ ${(%):-%m} = *bullfrog* ]]; then  #on my workstation
        if [[ ${(%):-%n} = *root* ]]; then  #on my workstation as root
                PROMPT='
%{$fg[blue]%}[ ⌚ %*%  ]%{$reset_color%} ${return_code}
%{$fg[red]%}[%n@%m]%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %{$fg[red]%}%#%{$reset_color%} '
        else                                #on my workstation as normal user
        PROMPT='
%{$fg[blue]%}[ ⌚ %*%  ]%{$reset_color%} ${return_code}
%{$fg[yellow]%}[%{$reset_color%}%n@%m%{$fg[yellow]%}]%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %# '
        fi
    else                                    #on remote workstation
        PROMPT='
%{$fg[blue]%}[ ⌚ %*%  ]%{$reset_color%} ${return_code}
%{$fg[magenta]%}[%n@%m]%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} %# '
    fi

    ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    RPROMPT='$(git_prompt_status) $(git_prompt_info)%{$reset_color%}'

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
    PROMPT='[%n@%m:%~$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

~/.dotfiles/bootstrap.sh
#
#
# ACK (Arch) or ACK-GREP for Debian/CentOS
alias cl='ack --passthru --color-match=green'

if [ -f /etc/debian_version ]; then
    alias cl='ack-grep --passthru --color-match=green'
fi

if [ -f /etc/centos-release ]; then
    alias cl='ack-grep --passthru --color-match=green'
fi

