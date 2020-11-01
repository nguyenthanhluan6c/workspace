
docker_kill(){
  docker container kill $(docker ps -q)
}
