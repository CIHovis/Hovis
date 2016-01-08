class greylog::install{
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
  
    exec { 'downloadgraylog':
    user    => root,
    cwd     => '/opt/',
	command => 'wget https://packages.graylog2.org/releases/graylog2-server/graylog-1.3.2.tgz?__hstc=151246182.1506bee5f72e0f7312a0811b9aad82fb.1452251759475.1452251759475.1452251759475.1&__hssc=151246182.5.1452251759475&__hsfp=601285525',
    before  => Exec['targreylog'], 
  }
  
   exec { 'targreylog':
    user    => root,
    cwd     => '/opt/',
	command => 'tar xvfz graylog-1.3.2.tgz',
	before  => Exec['cdgreylog'], 
  }
  
   exec { 'cdgraylog':
    user    => root,
    cwd     => '/opt/',
	command => 'cd graylog-1.3.2',
	before  => Exec['copyserverfile'], 
  }
   exec { 'copyserverfile':
    user    => root,
    cwd     => '/opt/',
	command => 'cp graylog.conf.example /etc/graylog/server/server.conf',
	before  => Exec['install'], 
  }
  
   exec { 'install':
    user    => root,
    cwd     => '/opt/',
	command => 'apt-get install openjdk-7-jre',
	before  => Exec['cdbin'], 
  }
  
   exec { 'cdbin':
    user    => root,
    cwd     => '/opt/',
	command => 'cd bin/',
	before  => Exec['startgreylog'], 
  }
  
   exec { 'startgreylog':
    user    => root,
    cwd     => '/opt/',
	command => './graylogctl start',
  }
}