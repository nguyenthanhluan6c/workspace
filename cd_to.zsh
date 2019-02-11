typeset -A hash all_projects

all_projects["workspace"]="~/my_bin/"
all_projects["shi"]="~/ruby/shigoto/"
all_projects["fl_hello"]="~/ruby/flutter/hello_world"
all_projects["ticket"]="~/ruby/xflag-ticket/"
all_projects["tdse"]="~/ruby/social-media-data-display-tool-for-beauty/"
all_projects["dd"]="~/ruby/CR_RegulationCheck/"
all_projects["pon"]="~/ruby/ponbot/"
all_projects["bff"]="~/ruby/easi-ui/"
all_projects["spice"]="~/ruby/spicebox-inc/"
all_projects["mon"]="~/ruby/monpass/"
all_projects["tiny"]="~/ruby/my-tinycards/"
all_projects["tiny_front"]="~/ruby/my-tinycards/angular2/"
all_projects["ag"]="~/ruby/agri-navi-rails/"
all_projects["gaku"]="~/ruby/mynavi-cms-develop/"
all_projects["mf"]="~/ruby/vagrant-for-mille-feuille/mille-feuille/"
all_projects["iot"]="~/ruby/iot/development_env/"

cd_to () {
  project_dir=$all_projects["$1"]
  if test $project_dir
    then
      eval $project_dir
    else
      echo "Not found project, please add in my_bin/cd_to"
  fi;
  exec zsh
}

projects() {
  echo "List all projects"
  for key val in ${(kv)all_projects}; do
    echo_help "cd_to $key" "OR cd $val"
  done
}
