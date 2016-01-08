class mongodb::install{
  Exec {
    timeout => 0,
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }
  
   exec { 'importpublickey':
    user    => root,
    cwd     => '/opt/',
	command => 'apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv EA312927',
    before  => Exec['creatfile'],
	require => [ Class['elasticsearch'], 
				 Class['mongodb'] ]
  }
  
   exec { 'creatfile':
    user    => root,
    cwd     => '/opt/',
	command => 'echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list',
    before  => Exec['update'],
  }
  
   exec { 'update':
    user    => root,
    cwd     => '/opt/',
	command => 'apt-get update',
	before  => Exec['installmongo'],
  }
  
   exec { 'installmongo':
    user    => root,
    cwd     => '/opt/',
	command => 'apt-get install -y mongodb-org',
	before  => Exec['startmongo'],
  }
  
   exec { 'startmongo':
    user    => root,
    cwd     => '/opt/',
	command => 'service mongod start',
  }
  
}