notify {"I'm notifying you.":} # Whitespace is fungible, remember.

group { 'awaal':
  			  ensure => 'present',
  			  gid    => '1001',
     }

  user { 'awaal':
    ensure             => present,
    comment  	       => 'Andre de Waal wijziging',
    password           => '$1$8FbWib7X$Fz9HM7sjC326pC3fmUxZu0',
    managehome         => true,
    groups             => 'awaal',
	shell			   => "/bin/bash",
  }
