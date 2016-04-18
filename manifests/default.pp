=begin
group { 'awaal':
  			  ensure => 'present',
  			  gid    => '1001',
     }
user { "awaal": 
	ensure => present,
	home => "/home/awaal",
	groups => "awaal",
	managehome => true,
	password => '$1$8FbWib7X$Fz9HM7sjC326pC3fmUxZu0',
	shell => "/bin/bash",
	}
=end