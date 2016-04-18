#!/bin/bash 
mkdir -p /etc/puppet/modules; 
if [ ! -d /etc/puppet/modules/puppetlabs-apt ]; then 
	puppet module install puppetlabs-apt 
fi 