#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
unset PACKAGES

PACKAGES="curl git bzr"
sudo -E apt-get clean
sudo -E -H apt-get update
sudo -E -H apt-get install -y -q --no-install-recommends ${PACKAGES}

unset gover
gover=1.6

curl -o go${gover}.linux-amd64.tar.gz https://storage.googleapis.com/golang/go${gover}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${gover}.linux-amd64.tar.gz
[ -f go${gover}.linux-amd64.tar.gz ] && rm go${gover}.linux-amd64.tar.gz

grep 'export GOROOT=' .bash_profile || ( echo export GOROOT=/usr/local/go | tee -a .bash_profile )
grep 'export GOPATH=' .bash_profile || ( echo export GOPATH=/vagrant/go | tee -a .bash_profile )
source .bash_profile
grep 'export PATH=' .bash_profile || ( echo export PATH=$PATH:$GOROOT/bin:$GOPATH/bin | tee -a .bash_profile)
source .bash_profile

sudo -E -H apt-get clean
[ -f /etc/udev/rules.d/70-persistent-net.rule ] && sudo rm -f /etc/udev/rules.d/70-persistent-net.rule || true
