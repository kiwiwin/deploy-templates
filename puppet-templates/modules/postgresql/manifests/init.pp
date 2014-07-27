class postgresql(
){
	anchor { 'postgresql::repo': }

	apt::ppa { 'ppa:chris-lea/postgresql-9.3': 
		before => Anchor['postgresql::repo'],
	}

	package { 'postgresql-9.3':
		require => Anchor['postgresql::repo']
	}	
}