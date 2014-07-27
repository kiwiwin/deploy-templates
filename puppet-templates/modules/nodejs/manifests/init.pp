class nodejs(
){
	anchor { 'nodejs::repo': }

	apt::ppa { 'ppa:chris-lea/node.js': 
		before => Anchor['nodejs::repo'],
	}

	package { 'nodejs':
		require => Anchor['nodejs::repo']
	}
}