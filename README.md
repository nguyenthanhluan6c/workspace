cd
git clone git@github.com:nguyenthanhluan6c/workspace.git

sudo apt install zsh -y
sudo apt-get install powerline fonts-powerline -y

rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
<!-- cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc -->

chsh -s /bin/zsh

reopen terminal then

omz update
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

gem install rails
rm -f ~/.zcompdump*; compinit