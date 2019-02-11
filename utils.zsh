_source(){
  source ~/.zshrc
}

_fuck(){
  fuck -y
}

_fk(){
  fuck -r
}


help(){
  hello
  projects

  echo "\n\nHelp"
  echo_help "projects" "List all projects"
  echo_help "cd_to PROJECT" "cd to PROJECT directory"
  echo_help "git_rebase BRANCH" "Checkout and rebase branch"
  echo_help "git_push" "Add and commit, push current branch"
  echo_help "git_push_am" "Add and commit amend, push current branch"

  echo_help "git_fetch BRANCH" "Backup current branch, fetch new branch from upstream"
  echo_help "git_fetch_pull PULL_ID" "Fetch a pull request from upstream"

  echo_help "start_mf" "Start vagrant mf project"

  echo_help "rdmd" "rake db:migrate:down VERSION"
  echo_help "rdmu" "rake db:migrate:up VERSION"

  echo_help "mysql_open" "Start mysql console"
  echo_help "mysql_info" "Show mysql variables"

  echo_help "_source" "Update source ~/.zshrc"
}


echo_help(){
  local GREEN='\033[0;32m' NC='\033[0m'
  printf "${GREEN} %-30s ${NC} %s\n" $1 $2
}

start_mf(){
  cd ~/ruby/vagrant-for-mille-feuille/
  vagrant up && vagrant ssh
}

start_mf(){
  cd ~/ruby/vagrant-for-mille-feuille/
  vagrant up && vagrant ssh
}

rdmd(){
  rake db:migrate:down VERSION=$1
}

rdmu(){
  rake db:migrate:up VERSION=$1
}

current_relative_path(){
  local CURRENT_PATH=$(pwd)
  local relative_path="~${CURRENT_PATH#*$HOME}"
  echo -e $relative_path
}
