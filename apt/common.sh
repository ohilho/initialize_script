# if you are root user and you don't have sudo yet...
apt update;
apt upgrade -y;
apt install sudo -y;

# install commonly used packages
sudo apt install build-essential git cmake zsh wget curl -y
