sudo apt update -y
sudo apt upgrade -y
# sudo apt install -y linux-tools-common
# sudo apt install -y linux-tools-5.15.0-86-generic
# sudo apt update -y
sudo apt-get install -y libgmp3-dev



sudo apt-get update -y



# echo "ClientAliveInterval 120" | sudo tee -a /etc/ssh/sshd_config
# echo "ClientAliveCountMax 720" | sudo tee -a /etc/ssh/sshd_config
# sudo systemctl restart sshd

# // write shell command to install perf
sudo apt-get install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`

sudo apt install -y python3-pip
pip3 install gmpy2