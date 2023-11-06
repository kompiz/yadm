# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

# Add homebrew autocomplete support
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# History
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
setopt EXTENDED_HISTORY
PROMPT_COMMAND='history -a'

# Test if machine has lxd-completion-zsh plugin, and if not, set an empty var
if [ -d ~/.oh-my-zsh/custom/plugins/lxd-completion-zsh ]; then
  export LXD_COMPL_ZSH=lxd-completion-zsh
else
  export LXD_COMPL_ZSH=''
fi

## Test if machine has kubetail plugin, and if not, set an empty var
#if [ -d ~/.oh-my-zsh/custom/plugins/kubetail ]; then
#  export KUBETAIL_ZSH=kubetail
#else
#  export KUBETAIL_ZSH=''
#fi

plugins=($KUBETAIL_ZSH $LXD_COMPL_ZSH git zsh-autosuggestions)

# Path for zsh-completions, needs to be before 'source $ZSH/oh-my-zsh.sh' line
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export LANG="en_US.UTF-8"
export LC_COLLATE="sv_SE.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"
export LC_MESSAGES="sv_SE.UTF-8"
export LC_MONETARY="sv_SE.UTF-8"
export LC_NUMERIC="sv_SE.UTF-8"
export LC_TIME="sv_SE.UTF-8"
export LC_ALL="en_US.UTF-8"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set default editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"

# Use all config.*yaml files in ~/.kube
export KUBECONFIG=$(echo $(find ~/.kube -type f -name "config*.yaml") | sed 's/[[:space:]]/:/g')

# Set AWS profile
export AWS_REGION=eu-north-1

# Add aliases
source ~/.aliases

# Add autocompletions
source ~/.autocompletions

# Add functions
source ~/.functions

# Add misc file if it exists
if [ -f ~/.misc ]; then
  source ~/.misc
else
  # Do nothing if the file doesn't exist
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wille/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wille/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wille/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wille/bin/google-cloud-sdk/completion.zsh.inc'; fi
