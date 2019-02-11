# http://codeboarding.com/2017/02/16/setup-a-private-git-server/

iot_stub(){
  cd ~/ruby/iot/development_env/raspberry_control && bundle exec ruby log-to-aws.rb reader.log*
}
