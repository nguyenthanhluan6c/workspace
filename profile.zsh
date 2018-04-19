# Add to ~/.zshrc

# export PATH="$PATH:$HOME/.rvm/bin"
# export PATH=$PATH:~/bin
# source ~/bin/profile.zsh

source ~/bin/utils.zsh
source ~/bin/cd_to.zsh
source ~/bin/git_alias.zsh

# Fixing-npm-permissions
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

eval $(thefuck --alias)
eval "$(direnv hook zsh)"
