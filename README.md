cd
git clone git@github.com:nguyenthanhluan6c/workspace.git

sudo apt install zsh
sudo apt-get install powerline fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
<!-- cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc -->

chsh -s /bin/zsh

reopen terminal then

upgrade_oh_my_zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

gem install rails
rm -f ~/.zcompdump*; compinit