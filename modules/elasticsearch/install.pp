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
  
  exec { 'downloadelasticsearch':
    user    => root,
    cwd     => '/opt/',
	command => 'wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.1/elasticsearch-2.1.1.tar.gz',
    before  => Exec['tarelasticsearch'], 
  }
  
   exec { 'tarelasticsearch':
    user    => root,
    cwd     => '/opt/',
	command => 'tar xvfz elasticsearch-2.1.1.tar.gz',
	before  => Exec['cdelasticsearch'], 
  }
  
   exec { 'cdelasticsearch':
    user    => root,
    cwd     => '/opt/',
	command => 'cd elasticsearch-2.1.1',
	before  => Exec['cdbin'], 
  }
  
   exec { 'cdbin':
    user    => root,
    cwd     => '/opt/',
	command => 'cd bin/',
	before  => Exec['curlcommand'], 
  }
  
   exec { 'curlcommand':
    user    => root,
    cwd     => '/opt/',
	command => 'curl -X GET http://localhost:9200/',
  }
  
  }
}