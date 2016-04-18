group { 'awaal':
  			  ensure => 'present',
  			  gid    => '1001',
     }

user { 'awaal':
      ensure           => 'present',
      home             => '/home/awaal',
      comment          => 'Andre de Waal',
	  groups		   => 'awaal',
      password         => 'awaal',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
	  uid			   => '1001',
    }