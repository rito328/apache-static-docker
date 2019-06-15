#!/usr/bin/env bash

function setup () {
  PUB_DIR=/var/www/html

  echo "Docker starting..."

  cd docker

  docker-compose up -d

  echo "
  +-----------------------------------+
    Apache Web Server Docker Started.

           http://localhost/
  +-----------------------------------+
  "
}
function stop () {
  cd docker
  docker-compose down
  cd ../
}
function restart () {
  stop
  setup
}
function destroy() {
  cd docker && docker-compose down --rmi all
}
function rebuild() {
  destroy
  setup
}
function connect_app () {
  docker exec -it web_app /bin/bash
}
function help () {
  echo "
  +--------------------------------------------------+
        +-+- Apache Web Server Docker Help -+-+

      setup   : Set up Laravel Docker.
      start   : Alias for setup.
      stop    : Stop the container.
      restart : Reboot the container.
      destroy : Delete containers and images.
      conn    : Connect to app container.
      help    : Display help.
  +--------------------------------------------------+
  "
}
function error_msg () {
  echo "Argument is missing. Please display help and check the argument.
  exp.) sh order.sh help
  "
}

case "$1" in
  "setup"   ) setup       ;;
  "start"   ) setup       ;;
  "stop"    ) stop        ;;
  "restart" ) restart     ;;
  "destroy" ) destroy     ;;
  "rebuild" ) rebuild     ;;
  "conn"    ) connect_app ;;
  "help"    ) help        ;;
  ""        ) error_msg   ;;
esac
