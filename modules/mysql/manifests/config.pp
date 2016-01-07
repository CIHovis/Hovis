class mysql::config{

    exec { 'becomeroot':
		user    => root,
		cwd     => '/usr/local',
		command => 'mysql -u root',
		notify  => Exec['changepassword'],
		creates => '/opt/configs/mysql_pass',
  }
  
    exec { 'changepassword':
		user    => root,
		cwd     => '/usr/local',
		command => "update user SET PASSWORD=PASSWORD('netbuilder') WHERE USER='root' || flush privileges || exit",
		notify  => Exec['stopmysql'],
		creates => '/opt/configs/mysql_pass',
  }
  
     service { 'mysqld':
		ensure => stopped,
		enable => true,
  }
  
     service { 'mysqld':
		ensure => running,
		enable => true,
  }
  
  File '/opt/configs/mysql_pass' {
		ensure   => present,
		requires => Exec['startmysql']
  }
}