#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

# Install Docker
curl -sSL https://get.docker.com | sh || error "Failed to install Docker."

# Get all users in sudo group and add them to the docker group
echo "Adding all sudoers to the docker group..."
for user in $(getent group sudo | cut -d: -f4 | tr ',' ' '); do
  sudo usermod -aG docker $user || error "Failed to add $user to the Docker usergroup."
  echo "Added $user to the Docker group."
done

echo "Remember to log off or reboot for the changes to take effect."
