#!/usr/bin/env bash
set -x
#
puppet apply --verbose /vagrant/puppet/manifests/site.pp --modulepath=/vagrant/puppet/modules/

