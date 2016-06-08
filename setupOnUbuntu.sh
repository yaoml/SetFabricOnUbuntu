#! /bin/bash
# Development on Ubuntu is done on the native OS, not in Vagrant. This script can be
# used to set up on Ubuntu, similar to devenv/setup.sh which does the
# same for Vagrant.
# See https://github.com/hyperledger/fabric/blob/master/docs/dev-setup/install.md
#


if [ xroot != x$(whoami) ]
then
   echo "You must run as root (Hint: sudo su)"
   exit
fi

apt-get update
apt-get install git curl gcc g++ yum  wget libc6-dev -y
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm
apt-get upgrade gcc g++ -y

#Set the maximum number of open files to 10000 or greater for your OS
ulimit -n 65535

#TODO: should really just open a few ports..
iptables -I INPUT 1 -j ACCEPT
sysctl vm.overcommit_memory=1


##################
# Install Docker
mkdir $HOME/tmp
cd /tmp

wget -qO- https://get.docker.com/ | sh

#TODO: Install on boot
nohup docker daemon -g /data/docker -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock&

##################
# Install Golang
curl -O https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz

mkdir -p ~/go; echo "" >> ~/.bashrc
cat >> ~/.bashrc <<EOF
      export GOPATH=$HOME/go
      export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
EOF

source ~/.bashrc
echo `go version`

rm go1.6.2.linux-amd64.tar.gz

################
#ROCKSDB BUILD

apt-get install -y libsnappy-dev zlib1g-dev libbz2-dev
cd /tmp
git clone https://github.com/facebook/rocksdb.git
cd rocksdb
git checkout v4.1

PORTABLE=1 make shared_lib
INSTALL_PATH=/usr make install-shared && ldconfig

################
#Install Pyenv Python
cd /tmp
sudo apt-get install libc6-dev gcc git -y
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm
# PIP
yum install python-setuptools
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install --upgrade pip
pip install behave nose docker-compose

# updater-server, update-engine, and update-service-common dependencies (for running locally)
pip install -I flask==0.10.1 python-dateutil==2.2 pytz==2014.3 pyyaml==3.10 couchdb==1.0 flask-cors==2.0.1 requests==2.4.3


##################
# clone project
mkdir -p $HOME/go/src/github.com/hyperledger
cd $HOME/go/src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric.git


cd fabric/
make peer unit-test
