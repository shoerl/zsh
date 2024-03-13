# Start up homebrew 
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="simplerich"
source /Users/seanhoerl/simplerich-zsh-theme/zsh-git-prompt/zshrc.sh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

#HIST_STAMPS="%m/%d/%y %R"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gcloud git-auto-fetch git-extras github gitignore jenv kubectl npm sublime fzf-tab)

# Run oh my zsh
source $ZSH/oh-my-zsh.sh

# User configuration
# --- Path Setup --- 

#export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/Projects/crio-testing-automation:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@20/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/node@20/include:$CPPFLAGS"

# Set-up VPN aliases
alias vpn-pass='echo 9B2QfG97TFTRdm2'
alias us_vpn='gcloud compute ssh --zone "us-east1-b" "openvpn-access-server-us-vm" --internal-ip --project "crio-canada"'
alias ca_vpn='gcloud compute ssh --zone "northamerica-northeast1-a" "openvpn-access-server-ca-vm" --internal-ip --project "crio-canada"'
alias au_vpn='gcloud compute ssh "openvpn-access-server-au-vm" --internal-ip  --project "crio-canada" --zone "australia-southeast1-b"'
alias eu_vpn='gcloud compute ssh --zone "europe-west3-c" "openvpn-access-server-eu-vm" --internal-ip --project "crio-canada"'

# Set-up Auth aliases
alias gcloud-auth="gcloud auth login --update-adc && npx google-artifactregistry-auth;"
alias auth="gcloud auth login --update-adc; npx google-artifactregistry-auth;"

# Set-up Proxy aliases
alias prod-proxy="~/Projects/cloud_sql_proxy -instances=crio-canada:us-east1:crio-mysql=tcp:3307"
alias proxy="gcloud auth login --update-adc; npx google-artifactregistry-auth; ~/Projects/cloud_sql_proxy -instances=crio-dev-267118:us-east1:dev-mysql=tcp:3307"
alias integration-proxy="gcloud auth login --update-adc; npx google-artifactregistry-auth; ~/Projects/cloud_sql_proxy -instances=crio-dev-267118:us-east1:crio-recruitment-api-integration=tcp:3307"
alias esource-proxy="gcloud auth login --update-adc; npx google-artifactregistry-auth; ~/Projects/cloud_sql_proxy -instances=crio-devesource-bd88:us-east1:dev-esource-useast1-siteapp=tcp:3307"
alias automation-proxy="gcloud auth login --update-adc; npx google-artifactregistry-auth; ~/Projects/cloud_sql_proxy -instances=crio-qaautomation-3d12:us-east1:qa-automation-useast1-connect=tcp:3307"
alias au-proxy="gcloud auth login --update-adc; npx google-artifactregistry-auth; ~/Projects/cloud_sql_proxy -instances=crio-canada:australia-southeast1:au-mysql=tcp:3307"
alias qa-deploy="( git tag -f deploy/qa && git push -f origin deploy/qa )"
alias gff="git fetch && git pull"

# --- Set-up G-Cloud SDK --- 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/seanhoerl/Projects/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seanhoerl/Projects/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seanhoerl/Projects/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seanhoerl/Projects/google-cloud-sdk/completion.zsh.inc'; fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && cd $HOME/Projects/
