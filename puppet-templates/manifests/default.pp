exec { 'init-update':
	command => 'apt-get update',
	path	=> '/usr/bin'
}

class { 'apt':
	always_apt_update => true,
	require => Exec['init-update']
}

include git
include nodejs
include java
include ruby
include mongodb
include postgresql