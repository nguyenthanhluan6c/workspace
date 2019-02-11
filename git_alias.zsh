zmodload -i zsh/regex

git_rebase(){
  last_branch=$(current_branch);

  git checkout $1 &&
  git pull upstream $1 &&
  git checkout $last_branch &&
  git rebase $1 && exit_success || exit_failure;
}

git_pull(){
  last_branch=$(current_branch);

  git checkout master &&
  git pull upstream master;

  git checkout develop &&
  git pull upstream develop && exit_success || exit_failure;
}

git_fetch(){
  reset_branch=$1;
  last_branch=$(current_branch);
  now=$(date +"%Y_%m_%d_%H%M%S");
  backup_branch=${last_branch}_${now}

  git checkout -b $backup_branch;
  print_info "Backup to branch: $backup_branch";

  git branch -D $last_branch &&
  git fetch origin $reset_branch:$reset_branch -f &&
  git checkout $reset_branch && exit_success || exit_failure;

  # git fetch origin && git fetch origin --tags &&
  # git reset --hard $reset_branch && exit_success || exit_failure;
}
git_fetch_pull(){
  pull_id=$1;
  git fetch origin pull/$pull_id/head:$pull_id && git checkout $pull_id
}

git_cm(){
  local repo_url repo_name repo_host browser_url last_commit commit_message

  commit_message=$1

  current_branch_name=$(current_branch)
  print_info $current_branch_name

  if [ $current_branch_name = "master" ] || [ $current_branch_name = "develop" ]; then
    print_error "CARE FULL, YOU ARE COMMITTING ON BRANCH $current_branch_name"
  fi

  # bundle rubocop -a

  git status
  git add -A

  last_commit=$(git --no-pager log --decorate=short --pretty=oneline -n1)
  print_info $last_commit

  if [[ $last_commit -regex-match "(.+)Merge (.+)" ]]; then
    echo $match
    local tmp_message

    if [[ $commit_message = *[!\ ]* ]]; then
      print_info "User branch:" $current_branch_name
      tmp_message=$commit_message
    else
      print_info "Blank:" $1
      tmp_message=$current_branch_name
    fi

    git commit -m $tmp_message
    print_info "Commited with message:" $tmp_message

  else
    git commit --amend --no-edit
    print_info "Commited amend" $current_branch_name

  fi
  exit_success
}

git_push(){
  local repo_url repo_name repo_host browser_url last_commit commit_message

  commit_message=$1

  current_branch_name=$(current_branch)
  print_info $current_branch_name

  if [ $current_branch_name = "master" ] || [ $current_branch_name = "develop" ]; then
    print_error "Don't push $current_branch_name"
    exit_failure
    return 1
  fi

  # bundle rubocop -a

  git status
  git add -A

  last_commit=$(git --no-pager log --decorate=short --pretty=oneline -n1)
  print_info $last_commit

  if [[ $last_commit -regex-match "(.+)Merge (.+)" ]]; then
    echo $match
    local tmp_message

    if [[ $commit_message = *[!\ ]* ]]; then
      print_info "User branch:" $current_branch_name
      tmp_message=$commit_message
    else
      print_info "Blank:" $1
      tmp_message=$current_branch_name
    fi

    git commit -m $tmp_message
    print_info "Commited with message:" $tmp_message

    git push origin $current_branch_name;
  else
    git commit --amend --no-edit
    print_info "Commited amend, and push" $current_branch_name

    git push origin $current_branch_name -f;
  fi

  repo_url=$(git config --get remote.origin.url)

  if [[ $repo_url -regex-match "(.+)@(.+):(.+)" ]]; then
    repo_host=$match[2]
    repo_name=$match[3]

    if [[ $repo_host -regex-match "(.*)github.com(.*)" ]]; then
      browser_url="https://github.com/${repo_name}"
    else
      browser_url="https://${repo_host}/${repo_name}"
    fi
  else
    print_error "No match"
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
    print_error "Don't push $current_branch_name"
    exit_failure
    return 1
  fi

  git status
  git add -A
  git commit --amend --no-edit
  git push origin $current_branch_name -f;

  print_info "Commited amend, and push" $current_branch_name
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


function blank_string() {
  if [[ $1 = *[!\ ]* ]]; then
    echo "String:" $1
  else
    echo "Blank:" $1
  fi
}

function test_repo() {
  if [ $1 -regex-match "(.+)@(.+):(.+)" ]; then
    repo_host=$match[2]
    repo_name=$match[3]

    if [ $1 -regex-match "(.*)github.com(.*)" ]; then
      browser_url="https://github.com/${repo_name}"
    else
      browser_url="https://${repo_host}/${repo_name}"
    fi
  else
    print_error "No match"
    exit_failure
    return 1;
  fi

  echo $browser_url
}


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
  printf "${GREEN}%-50s ${NC} %s\n" $1 $2
}

print_error(){
  local RED='\033[0;31m' NC='\033[0m'
  printf "${RED}%-50s ${NC} %s\n" $1 $2
}
