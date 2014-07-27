class nodejs(
){
	exec { 'init-update':
		command => 'apt-get update',
		path	=> '/usr/bin'
	}

	class { 'apt':
		always_apt_update => true,
		require => Exec['init-update']
	}

	anchor { 'nodejs::repo': }

	apt::ppa { 'ppa:chris-lea/node.js': 
		before => Anchor['nodejs::repo'],
	}

	package { 'nodejs':
		require => Anchor['nodejs::repo']
	}
}