sudo apt update
sudo apt upgrade
sudo apt install linux-tools-common
sudo apt install linux-tools-5.15.0-86-generic
sudo apt update
sudo apt-get install libgmp3-dev

sudo apt-get install -y systemtap gcc
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C8CAB6595FDFF622

sudo apt-get update

codename=$(lsb_release -c | awk  '{print $2}')
sudo tee /etc/apt/sources.list.d/ddebs.list << EOF
deb http://ddebs.ubuntu.com/ ${codename}      main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-security main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-updates  main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-proposed main restricted universe multiverse
EOF

sudo apt-get update
sudo apt-get install linux-image-$(uname -r)-dbgsym
sudo apt-get install linux-image-$(uname -r)-dbg

# // write shell command to increase the timeout time of ssh disconnetion
# // Do the following
# // sudo nano /etc/ssh/sshd_config
# // Add the following line
# // ClientAliveInterval 120
# // ClientAliveCountMax 720
echo "ClientAliveInterval 120" | sudo tee -a /etc/ssh/sshd_config
echo "ClientAliveCountMax 720" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# // write shell command to install perf
sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`
git config --global credential.helper 'cache --timeout=3600'
# chmod +x git_push.sh
# nohup ./git_push.sh > ~/nohup.out 2>&1 &
# sudo chmod -R 777 .
