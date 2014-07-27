class java(
){
	anchor { 'java8::repo': }

	apt::ppa { 'ppa:webupd8team/java': 
		before => Anchor['java8::repo']
	}

	exec { 'select-oracle-jdk-license':
		command => 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections',
		path 	=> '/bin'
	}

	package { 'oracle-java8-installer':
		require => [ Anchor['java8::repo'], Exec['select-oracle-jdk-license'] ]
	}
}