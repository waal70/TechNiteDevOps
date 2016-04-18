exec { "apt-get update":
  path => "/usr/bin",
}
group { 'awaal':
  			  ensure => 'present',
  			  gid    => '1001',
     }

package { "apache2":
  ensure  => present,
  require => Exec["apt-get update"],
}
service { "apache2":
  ensure  => "running",
  require => Package["apache2"],
}
file { "/var/www/sample-webapp":
  ensure  => "link",
  target  => "/vagrant/sample-webapp",
  require => Package["apache2"],
  notify  => Service["apache2"],
  }
user { "awaal": 
	ensure => present,
	home => "/home/awaal",
	groups => "awaal",
	managehome => true,
	password => '$1$8FbWib7X$Fz9HM7sjC326pC3fmUxZu0',
	shell => "/bin/bash",
	}
	