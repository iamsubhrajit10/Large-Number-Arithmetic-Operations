sudo apt update
sudo apt upgrade
sudo apt install linux-tools-common
sudo apt install linux-tools-5.15.0-86-generic
sudo apt update
sudo apt-get install libgmp3-dev
git clone https://github.com/iamsubhrajit10/Large-Number-Arithmetic-Operation

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

