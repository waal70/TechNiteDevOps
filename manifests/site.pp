# TechNiteDevOps general class
# The resources defined here are applied to ALL servers
class base {

  ### USERS MANAGEMENT 
  include base::users 
  
  # Users and groups "realized" on every nodes
  User <| title == root |> # Root Password management
  User::Managed <| tag == admins |> 
  User::Managed <| tag == developers |> 
  Group <| tag == admins |>
  Group <| tag == developers |> 

  # Quick /etc/hosts
  file { '/etc/hosts':
    ensure   => present ,
    content  => template('tndo/hosts/hosts.erb'),
	}
}