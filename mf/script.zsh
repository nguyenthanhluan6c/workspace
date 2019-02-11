# http://codeboarding.com/2017/02/16/setup-a-private-git-server/

mf_help(){
  echo "mf_remote_spec             : Push code to support server"
  echo "mf_ssh                     : SSH to support server"
  echo "support_spec branch_name   : rspec on support server"
  echo "support_spec_rerun branch_name   : rspec on support server"
}

mf_ssh(){
  ssh -i ~/.ssh/support_id_rsa support@192.168.0.146
}
mf_scp(){
  echo "Start mf_scp"
  ssh -i ~/.ssh/support_id_rsa support@192.168.0.146 "cd && mkdir mf"

  # cd mf/git/
  scp -i ~/.ssh/support_id_rsa -r /home/nguyenthanhluan/ruby/vagrant-for-mille-feuille/mille-feuille/support.zip support@192.168.0.146:mf
  ssh -i ~/.ssh/support_id_rsa support@192.168.0.146 "unzip ~/mf/support.zip -d ~/mf/git"

  # ssh -i ~/.ssh/support_id_rsa support@192.168.0.146 "export QT_QPA_PLATFORM=offscreen"
  ssh -i ~/.ssh/support_id_rsa support@192.168.0.146 "cd ~/mf/git/ && ls"

  rm -rf "support.zip"
  echo "mf_scp Done!"
}

mf_remote_spec(){
  last_branch=$(current_branch);
  git_cm
  git push support $last_branch -f

  echo "Push code to support server: "
  echo $last_branch
  echo "Done! "
}

support_spec(){
  target_branch=$1;
  cd ~/mf/mille-feuille
  git checkout master && git branch -D $target_branch && git fetch support $target_branch:$target_branch
  git checkout $target_branch

  bundle exec rspec spec/models/monitoring_event_filter_spec.rb spec/features/monitoring_event_filters_spec.rb
}

mf_memo(){
  # sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
}

# Setup git server
  # cd mf

  # cd && mkdir git
  # git init --bare git/mille-feuille.git


# Setup support git client
# mkdir -p mf
# cd mf
# git clone support@192.168.0.146:git/mille-feuille.git
# git remote add support support@192.168.0.146:git/mille-feuille.git


# Setup local

# git remote add support support@192.168.0.146:git/mille-feuille.git


mf_zip(){
  git archive HEAD --output=support.zip
}

mf_spec(){
  bundle exec rspec spec/models/monitoring_event_filter_spec.rb spec/features/monitoring_event_filters_spec.rb
  # bundle exec rspec spec/models/monitoring_event_filter_spec.rb spec/features/monitoring_event_filters_spec.rb --only-failures
}

support_spec_rerun(){
  bundle exec rspec spec/models/monitoring_event_filter_spec.rb spec/features/monitoring_event_filters_spec.rb --only-failures
}

mf_pull(){
  last_branch=$(current_branch);

  git checkout features/ruby-event-handling && git pull --rebase origin features/ruby-event-handling
  git checkout features/ruby-ext-info && git pull --rebase origin features/ruby-ext-info

  git checkout $last_branch
}
