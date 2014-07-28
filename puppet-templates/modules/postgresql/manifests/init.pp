class postgresql(
){
	anchor { 'postgresql::repo': }

	apt::ppa { 'ppa:chris-lea/postgresql-9.3': 
		before => Anchor['postgresql::repo'],
	}

	package { 'postgresql-9.3':
		require => Anchor['postgresql::repo']
	}	

	#notice restart server when configuration file changed
	#see documentation of puppet cookbook: http://www.puppetcookbook.com/posts/restart-a-service-when-a-file-changes.html
	service { 'postgresql':
		ensure => 'running',
		enable => 'true',
		require => Package['postgresql-9.3']
	}

	file { '/etc/postgresql/9.3/main/pg_hba.conf':
		notify => Service['postgresql'],
		require => Package['postgresql-9.3'],
		source => "/vagrant/modules/postgresql/files/pg_hba.conf"
	}

	#even we may change two files at same time, but we will just notify the service to restart once
	file { '/etc/postgresql/9.3/main/postgresql.conf':
		notify => Service['postgresql'],
		require => Package['postgresql-9.3'],
		source => "/vagrant/modules/postgresql/files/postgresql.conf"
	}
}