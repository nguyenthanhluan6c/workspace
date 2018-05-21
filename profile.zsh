# Add to ~/.zshrc

# export PATH="$PATH:$HOME/.rvm/bin"
# export PATH=$PATH:~/bin
# source ~/bin/profile.zsh

source ~/bin/.env
source ~/bin/utils.zsh
source ~/bin/cd_to.zsh
source ~/bin/git_alias.zsh
source ~/bin/mysql.zsh

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# Fixing-npm-permissions
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
export PATH=~/development/flutter/bin:$PATH

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


eval $(thefuck --alias)
# eval "$(direnv hook zsh)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# gem env home
# should be /home/nguyenthanhluan/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0

# Uninstall rbenv
# sudo apt-get remove --auto-remove rbenv

# export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Uninstall RVM
# rvm implode
# gem uninstall rvm
