# Set timestamps for history
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Append changes to history to history file
shopt -s histappend

# Store history immediately
PROMPT_COMMAND='history -a'

# Don't log ls, ps and history
export HISTIGNORE="ls:ps:history"

# Store multi-line commands in one history entry
shopt -s cmdhist

# Don't print the zsh warning in macos terminal 
export BASH_SILENCE_DEPRECATION_WARNING=1

# Add colors to macos terminal
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

## Activate bash completion if possible
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#complete -F __start_kubectl k
#complete -F _multipass_complete mp

#source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.

# Aliases
alias ll="ls -al"
alias ..="cd .."

alias mp="multipass"

alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kns="kubens"
alias kctx="kubectx"

export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

## Tmux checker and/or attacher/starter
#if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#  tmux attach-session -t 0 || tmux new-session -s 0
#fi
