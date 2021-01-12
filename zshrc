export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

eval "$(jump shell)"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/asdf",   from:oh-my-zsh
zplug "zpm-zsh/ssh"
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug load

export EDITOR="vim"

bindkey -v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey "^R" history-incremental-search-backward
