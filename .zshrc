# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Test if machine has lxd-completion-zsh plugin, and if not, set an empty var
if [ -d ~/.oh-my-zsh/custom/plugins/lxd-completion-zsh ]; then
  export LXD_COMPL_ZSH=lxd-completion-zsh
else
  export LXD_COMPL_ZSH=''
fi

# Test if machine has kubetail plugin, and if not, set an empty var
if [ -d ~/.oh-my-zsh/custom/plugins/kubetail ]; then
  export KUBETAIL_ZSH=kubetail
else
  export KUBETAIL_ZSH=''
fi


plugins=($KUBETAIL_ZSH $LXD_COMPL_ZSH git terraform)

# Path for zsh-completions, needs to be before 'source $ZSH/oh-my-zsh.sh' line
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Kubectl autocompletion
source <(kubectl completion zsh)
complete -F __start_kubectl kc

# Argocd autocompletion
source <(argocd completion zsh)

# Make autocomplete work properly
autoload -U compinit && compinit

# Set default editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"

# Hack to make watch accept aliases
alias watch='watch '

# Aliases
alias kc="kubectl"
alias kg="kubectl get"
alias kgeverything="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found"
alias kd="kubectl describe"
alias kw="kubectl --watch"
alias ke="kubectl edit"
alias kep="kubectl edit pod"
alias kes="kubectl edit svc"
alias ked="kubectl edit deployment"
alias ka="kubectl apply"
alias kdel="kubectl delete"
alias kdelsel="kubectl delete pods --selector"
alias kdelcomp="kubectl delete pod --field-selector=status.phase==Succeeded"
alias kgp="kubectl get pods -o wide"
alias kgs="kubectl get svc -o wide"
alias kdp="kubectl describe pod"
alias kgi="kubectl get ingress"
alias kgir="kubectl get ingressroute"
alias kgya="kubectl -oyaml get"
alias keir="kubectl edit ingressroute"
alias kcx="kubectx"
alias kns="kubens"
alias klog="kubectl logs"
alias ksh="kubectl exec --stdin --tty"
alias wkga="watch kubectl get pods"
alias wkgaa="watch kubectl get pods -A"

alias kt="kubetail"
alias ks="kubeseal"
alias ccl="calicoctl"
alias tf="terraform"
#alias argologin="kubens argocd && argocd login argocd.k8s.dockyards.io --core"

alias acd="argocd"

# Function for showing base64 encoded secrets
kgsec() { kubectl get secret "$1" -ojson | jq -r '.data | map_values(@base64d) | .[]'; }

# Function for showing certificate issuer, subject, and relevant dates - sadly only works on Linux 
certchk() { 
        openssl storeutl -noout -text -certs "$1" | grep 'Issuer:\|Validity\|Not Before\|Not After\|Subject:\|Alternative\|DNS:'
}

# Function for doing a recursive replace on mac as I can't seem to get along with BSD sed - use with care, prob super dangerous =)
recurs-replace() {
        grep -e "$1" -rl . | xargs sed -i '' "s/$1/$2/g"
}

# If on mac, do some things, otherwise assume Linux
if [ -d /Users ]; then
  alias ip="ip"
  export LANGUAGE=en:en_US:en
else
  alias ip="ip -c -br"
fi

# Use all config.*yaml files in ~/.kube
export KUBECONFIG=$(echo $(find ~/.kube -type f -name "config*.yaml") | sed 's/[[:space:]]/:/g')

