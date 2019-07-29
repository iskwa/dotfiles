# use escapse squence
setopt prompt_subst

# prompt
local DEFAULT=$'%{\e[01;m%}'
local RED=$'%{\e[01;31m%}'
local GREEN=$'%{\e[01;32m%}'
local YELLOW=$'%{\e[01;33m%}'
local BLUE=$'%{\e[01;34m%}'
local PURPLE=$'%{\e[01;35m%}'
local CYAN=$'%{\e[36m%}'
local GRAY=$'%{\e[01;37m%}'

if [ $TERM = "dumb" ]; then
  PROMPT="> "
else
  PROMPT=$GREEN"$USER$GREEN@%m$YELLOW%B[%w %T]$GREEN%(!.#.%%)$DEFAULT "
  RPROMPT=$CYAN'[%~]'$DEFAULT
fi

#if [ $USER = "root" ] 
#then
#    PROMPT="%{[$[31]m%}%B$LOGNAME@%m[%W %T]:%b%{[m%} %h# "
#    RPROMPT="[%{[31m%}%~%{[m%}]"
#    PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
#    HOME=/root
#else
#    PROMPT="%{[$[32+$RANDOM % 5]m%}$LOGNAME@%m%B[%W%T]:%b%{[m%} %h%% "
#    RPROMPT="[%{[33m%}%~%{[m%}]"
#fi

autoload promptinit
promptinit

# compinit
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
compdef _man w3mman
compdef _tex platex

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000

# bindkey
bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

autoload colors

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# options
unsetopt no_glob mail_warning
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt auto_remove_slash
setopt complete_in_word
setopt correct
setopt correct_all 
setopt extended_glob
setopt extended_history
setopt glob_complete
setopt glob_dots
setopt multios
setopt hist_ignore_dups
setopt hist_ignore_space
setopt ignore_eof
setopt interactive_comments
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
setopt share_history
setopt sun_keyboard_hack
setopt pushd_ignore_dups
setopt zle
setopt no_check_jobs

# alias
#alias find='command gfind'
#alias xargs='command gxargs'
alias ls='command ls -hF --color=always'
alias ll='ls -l'
alias lf='ls -f'
alias la='ls -al'
#alias vim='/usr/bin/vim -u /usr/share/vim/vimrc'
alias vi=vim
alias gvim="vim -g"
alias view=vim -R
alias less='less -r'

alias irb='irb --simple-prompt'
alias ruby='ruby -rubygems'

alias rails='rails _1.2.6_'
