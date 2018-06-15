cd_to () {
  case $1 in
    "workspace")
      cd ~/bin/
      exec zsh
      ;;
    "shi")
      cd ~/ruby/shigoto/
      exec zsh
      ;;

    "fl_hello")
      cd ~/ruby/flutter/hello_world
      exec zsh
      ;;
    "ticket")
      cd ~/ruby/xflag-ticket/
      exec zsh
      ;;
    "tdse")
      cd ~/ruby/social-media-data-display-tool-for-beauty/
      exec zsh
      ;;
    "dd")
      cd ~/ruby/CR_RegulationCheck/
      exec zsh
      ;;
    "spice")
      cd ~/ruby/spicebox-inc/
      exec zsh
      ;;
    "mon")
      cd ~/ruby/monpass/
  	  exec zsh
      ;;
    "tiny")
      cd ~/ruby/my-tinycards/
      exec zsh
      ;;
    "tiny_front")
      cd ~/ruby/my-tinycards/angular2/
      exec zsh
      ;;
    "ag")
      cd ~/ruby/agri-navi-rails/
      exec zsh
      ;;
    "gaku")
      cd ~/ruby/mynavi-cms-develop/
      exec zsh
      ;;
    *)
      echo "Not found project, please add in bin/cd_to"
      ;;
  esac
}

projects() {
  echo "List all projects"
  readonly projects=(
    'workspace|~/bin/'
    'shi|/ruby/shigoto/'
    'fl_hello|/ruby/flutter/hello_world/'
    'tdse|~/ruby/social-media-data-display-tool-for-beauty/'
    'ticket|~/ruby/xflag-ticket/'
    'dd|~/ruby/CR_RegulationCheck/'
    'spice|~/ruby/spicebox-inc/'
    'mon|~/ruby/monpass/'
    'tiny|~/ruby/my-tinycards/'
    'tiny_front|~/ruby/my-tinycards/angular2/'
    'ag|~/ruby/agri-navi-rails/'
    'gaku|~/ruby/mynavi-cms-develop/'
    )

  local project path
  for fields in ${projects[@]}
  do
    IFS=$'|' read -r project path <<< "$fields"
    echo_help "cd_to $project" "OR cd $path"
  done
}
