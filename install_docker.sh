#!/bin/bash
function disconnected {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_online() {
  printf "Checking online..."
    wget -q --spider http://github.com
    if [ $? -eq 0 ]; then
    echo "Online."
  else
    error "You are Offline."
  fi
}

check_online


curl -sSL https://get.docker.com | sh || disconnected "Failed to install Docker!"
sudo usermod -aG docker $USER || disconnected "Failed to add user to the Docker usergroup!"
echo "Please reboot for take effect."
