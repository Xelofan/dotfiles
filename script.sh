#!/bin/bash

###########################################
### https://github.com/Xelofan/dotfiles ###
###########################################

GRN="\033[0;32m"
RED="\033[0;31m"
YLW="\033[0;33m"
NC="\033[0m"

msg(){
  echo -e "\n[DOTFILES: ${YLW}Info${NC}] $1\n"
}
suc(){
  echo -e "\n[DOTFILES: ${GRN}Success${NC}] $1\n"
}
err(){
  echo -e "\n[DOTFILES: ${RED}Error${NC}] $1\n"
}

# Function to check if command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

cmd() {
  if [ "$(id -u)" -eq 0 ]; then
    $@
  else
    sudo $@
  fi
}

if [ "$(id -u)" -ne 0 ]; then
  ASKPASS="-K"
fi

if [ -f /etc/os-release ]; then
  source /etc/os-release
  OS=$ID
  VERSION_ID=$VERSION_ID
elif [ "$(uname)" = "Darwin" ]; then
  # For macOS
  OS="darwin"
  VERSION_ID=$(sw_vers -productVersion)
  NAME=$(sw_vers -productName)
else
  err "Undetectable operating system, exiting.."
  exit 1
fi

msg "Detected OS: $NAME ($VERSION_ID), installing ansible, git.."

case $OS in
  ubuntu)
    if [ $VERSION_ID = "22.04" ]; then
      cmd apt-get update
      cmd apt-get install git -y
      
      if ! command_exists pip3; then
        cmd apt-get install python3-pip -y
      fi
      
      if [ "$(id -u)" -eq 0 ]; then
        pip3 install ansible
      else
        pip3 install --user ansible
      fi
      
    elif [ "$(echo $VERSION_ID | cut -d '.' -f 1)" -ge 24 ]; then
      cmd apt-get update
      cmd apt-get install git ansible -y
    fi
    ;;
    
  debian)
    if [ $VERSION_ID -ge 12 ]; then
      cmd apt-get update
      cmd apt-get install git ansible -y
    fi
    ;;

  pop)
    if [ $VERSION_ID = "22.04" ]; then
      cmd apt-get update
      cmd apt-get install git -y
      
      if ! command_exists pip3; then
        cmd apt-get install python3-pip -y
      fi
      
      if [ "$(id -u)" -eq 0 ]; then
        pip3 install ansible
      else
        pip3 install --user ansible
      fi
      
    elif [ "$(echo $VERSION_ID | cut -d '.' -f 1)" -ge 24 ]; then
      cmd apt-get update
      cmd apt-get install git ansible -y
    fi
    ;;
    
  opensuse*)
    cmd zypper refresh
    
    # Install git, and ansible
    cmd zypper -n install git ansible
    ;;
    
  fedora*)
    cmd dnf makecache --refresh
    cmd dnf in git ansible -y
    ;;
    
  arch)
    cmd pacman -Sy
    cmd pacman -S --noconfirm git ansible
    ;;
    
  darwin)
    brew install git ansible
    ;;
    
  *)
    err "Unsupported operating system found: $NAME ($VERSION_ID)"
    exit 1
    ;;
esac

suc "Installation completed"

msg "Running dotfiles playbook.."

if command_exists ansible-pull; then
  ansible-pull -U https://github.com/xelofan/dotfiles playbook.yml $ASKPASS
else
  err "Could not run 'ansible-pull', exiting.."
  exit 1
fi
