git_rebase(){
  last_branch=$(current_branch);

  git checkout $1 &&
  git pull origin $1 &&
  git checkout $last_branch &&
  git rebase $1 && exit_success || exit_failure;
}

git_push_6c(){
  # git remote add origin git@github.com-nguyenthanhluan6c:nguyenthanhluanFramgia/workspace.git

  if [ $1 = "master" ] || [ $1 = "develop" ]; then
    echo "Don't push $current_branch_name"
    return 1
  fi

  git status
  git add -A
  git commit --amend --no-edit
  GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_nguyenthanhluan6c" git push origin $1 -f
}

git_push(){
  local repo_url repo_name repo_host browser_url last_commit

  current_branch_name=$(current_branch)
  echo $current_branch_name

  if [ $current_branch_name = "master" ] || [ $current_branch_name = "develop" ]; then
    echo "Don't push $current_branch_name"
    exit_failure
    return 1
  fi

  git status
  git add -A

  last_commit=$(git --no-pager log --decorate=short --pretty=oneline -n1)

  if [[ $last_commit=~"merge(.+)" ]]; then
    git commit --amend --no-edit
    print_info "Commited amend, and push" $current_branch_name

    git push origin $current_branch_name -f;
  else
    git commit -m $current_branch_name
    print_info "Commited with message:" $current_branch_name

    git push origin $current_branch_name;
  fi


  repo_url=$(git config --get remote.origin.url)
  if [[ $repo_url=~"(.+)@(.+):(.+)" ]]; then
    repo_host=$match[2]
    repo_name=$match[3]
    browser_url="https://github.com/${repo_name}"
  else
    echo "no match"
    exit_failure
    return 1;
  fi

  if [ "$(uname)" = "Darwin" ]; then
    open -a /Applications/Firefox.app -g $browser_url
  elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    BROWSER=google-chrome google-chrome $browser_url
  elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  fi
  exit_success
}

git_push_am(){
  current_branch_name=$(current_branch)
  echo $current_branch_name

  if [ $current_branch_name = "master" ] || [ $current_branch_name = "develop" ]; then
    echo "Don't push $current_branch_name"
    exit_failure
    return 1
  fi

  git status
  git add -A
  git commit --amend --no-edit
  git push origin $current_branch_name -f;

  echo "Commited amend, and push" $current_branch_name
  exit_success
}



# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

function exit_failure() {
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo -e "${RED}Aborted due to an error: $1"
}

function exit_success() {
  GREEN='\033[0;32m'
  echo -e "${GREEN}DONE"
}

print_info(){
  local GREEN='\033[0;32m' NC='\033[0m'
  printf "${GREEN} %-30s ${NC} %s\n" $1 $2
}
