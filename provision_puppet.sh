#!/usr/bin/env bash
#set -x
#
#puppet apply --verbose /vagrant/puppet/manifests/site.pp --modulepath=/vagrant/puppet/modules/
grep -q puppet /etc/hosts
if [ "$?" -ne 0 ]; then
  echo "192.168.42.99   puppet.test.lab" >> /etc/hosts
fi
puppet agent --verbose --debug --test --waitforcert=60 --server=puppet.test.lab
