# Class: artifactory
# ===========================
#
# Full description of class artifactory here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'artifactory':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class artifactory (

 $artifactory_download_server="192.168.1.201",
 $artifactory_file="jfrog-artifactory-oss-2.2.0.zip",
){

Exec {
 path => ["/usr/bin","/bin","/opt/sbin"]
}

package {'wget':
 ensure => 'installed',
}

package { 'unzip':
 ensure => 'installed',
}

exec {'download_artifactory':
 cwd => "/opt",
 creates => "/opt/jfrog-artifactory-oss-4.4.0.zip"
 command => "wget ${artifactory_download_server}${$artifactory_file}",
 require => Package['wget'],
}

exec {'extract_artifactory':
 creates => "/opt/jfrog-artifactory-oss-4.4.0",
 command => "unzip ${artifactory_file}",
 cwd => "/opt",
 require => Exec['download_artifactory'], Package ['unzip'], 
}

exec {'install_artifactory_service':
 require => Exec['extract_artifactory'],
 command => "/opt/jfrog-artifactory-oss-4.4.0/bin/installService.sh",
 creates => "/etc/init.d/artifactory",
} 

service {'running_artifactory':
 ensure => 'running',
 name => 'artifactory',
 require => Exec['install_artifactory_service'],
}
} 
