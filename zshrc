# Homebrew lives in /opt/homebrew on Apple Silicon and /usr/local on Intel
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  [[ -x $brew_bin ]] && eval "$($brew_bin shellenv)" && break
done
export ZPLUG_HOME="${HOMEBREW_PREFIX:-/usr/local}/opt/zplug"
source $ZPLUG_HOME/init.zsh

command -v jump >/dev/null && eval "$(jump shell)"

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
