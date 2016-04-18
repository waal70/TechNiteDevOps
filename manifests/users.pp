# users.pp
# Class: base::users
class base::users {

  # GROUPS
  @group { 'admins':
    ensure => present,
    gid    => '999',
    tag    => 'admins',
  }

  @group { 'developers':
    ensure => present,
    gid    => '998',
    tag    => 'developers',
  }

  @group { 'deployers':
    ensure => present,
    gid    => '997',
    tag    => 'deployers',
  }

  # ROOT (Password: example42)
  @user { 'root':
    ensure     => present,
    password   => '$6$vBEPA3af$RFqXswJnXqzAoLQ6eLNnRWKJNGq6Ic1yulsRUt2l199V8aMbEvgeUwgrwqD59tbs4UpoaY1C.fWt.3zVzVs570',
  }

  # USERS

  # User AWAAL
  # Password: awaal
  @user::managed { 'awaal':
    ensure             => present,
    name_comment       => 'Andre de Waal',
    password           => '$1$8FbWib7X$Fz9HM7sjC326pC3fmUxZu0',
    managehome         => true,
    groups             => 'awaal',
    tag                => 'developers',
    password_crypted   => true,
    manage_group       => true,
	shell			   => "/bin/bash",
  }

}