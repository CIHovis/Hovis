class jira::install{
  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }

  #download the file
  exec { 'wget_jira':
    cwd     => '/opt/',
    command => 'sudo wget http://192.168.1.6:8080/downloads/atlassian-jira-6.4.9-x64.bin',
    before  => Exec['chmod_jira'],
    timeout => 0,
	creates => '/opt/atlassian-jira-6.4.9-x64.bin',
  }


 file { '/opt/atlassian-jira-6.4.9-x64.bin':
   mode    => '0775'
   before  => Exec['startjira'],
 }

  exec { 'startjira':
    cwd     => '/opt/',
    command => 'printf "yn\on\1n\2n\8082n\8006n\in" | ./atlassian-jira-6.4.9-x64.bin',
  }
}


