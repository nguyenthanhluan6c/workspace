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
  echo_help "_source" "Update source ~/.zshrc"
}


echo_help(){
  local GREEN='\033[0;32m' NC='\033[0m'
  printf "${GREEN} %-30s ${NC} %s\n" $1 $2
}
