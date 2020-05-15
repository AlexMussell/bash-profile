#!/bin/bash
export EDITOR='vim'

##--OTHER
alias checkcert='openssl s_client -connect "$1":443 | openssl x509 -text -noout'
alias path='echo $PATH | tr ":" "\n" | nl'
alias refresh="source ~/.bash_profile"
alias grep='grep --color'
alias watch='watch --color'


# -p: suffix directories with `/`
if [ "$(uname -s)" == "Darwin" ]; then
  alias ls='ls -Gp'
elif [ "$(uname -s)" == "Linux" ]; then
  alias ls='ls --group-directories-first --color=auto -p'
fi

export LESS='-RNMs'
if [ "$(uname -s)" == "Darwin" ]; then
  # syntax highlighting
  export LESSOPEN="| source-highlight-esc.sh %s"
fi


function getGitBranch {
    local branchName="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
    if [[ ! -z $branchName ]]; then
        echo " ($branchName)"
    else
        echo ""
    fi
}
export -f getGitBranch
export PS1="\u:\[$(tput sgr0)\]\[\033[38;5;2m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\$(getGitBranch):\\$ \[$(tput sgr0)\]"


##Set Iterm title to show current dir
function addToPromptCommand {
  PROMPT_COMMAND="${PROMPT_COMMAND:-""}"
  if [[ ":$PROMPT_COMMAND:" != *":$1:"* ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND} $1;"
  fi
}

ITERM_SESSION_ID="${ITERM_SESSION_ID:-false}"
if [ $ITERM_SESSION_ID ]; then
      addToPromptCommand 'echo -ne "\033];${PWD##*/}\007"'
fi


##--HISTORY
# ignore .ds_store files (improves suggestions on osx)
FIGNORE="${FIGNORE:-""}"
export FIGNORE="${FIGNORE}:DS_Store"
# increase history size
export HISTFILESIZE="100000"
export HISTSIZE="${HISTFILESIZE}"
# display timestamps with commands
export HISTTIMEFORMAT="%d/%m/%y %T "
# dont store duplicate commands
export HISTCONTROL='ignoreboth:erasedups'
# dont store certain commands (nor commands with a space before)
export HISTIGNORE='&:[ ]*:exit:ls:bg:fg:history'
# save multi line commands as a single line
shopt -s cmdhist
# append instead of overwrite history
shopt -s histappend
# write to history after every command rather than at exit
addToPromptCommand 'history -a'



#Generalised extract
function extract {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}
export -f extract


# display man pages in colour
function man {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
export -f man


##--SHELL
# make auto-complete case-insensitive
bind 'set completion-ignore-case on'
# update window size after every command
shopt -s checkwinsize
# display suggestions for ambiguous patterns rather than just bell
bind "set show-all-if-ambiguous on"

# OSX specific
if [ "$(uname -s)" == "Darwin" ]; then
  # run brew quicker by not updating every single time
  export HOMEBREW_NO_AUTO_UPDATE=1
  # disable brew tracking
  export HOMEBREW_NO_ANALYTICS=1
fi
