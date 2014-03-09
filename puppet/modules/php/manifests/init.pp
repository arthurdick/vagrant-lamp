class php {
  package { 'php5':
    ensure => 'present',
    require => Exec['apt-get update'],
  }
  
  package { 'libapache2-mod-php5':
    ensure => 'present',
    require => Package['php5'],
  }
  
  package { 'php5-mysql':
    ensure => 'present',
    require => Package['php5'],
  }
  
  file { '/etc/php5/apache2/php.ini':
    ensure => 'present',
    source => 'puppet:///modules/php/php.ini',
    owner => 'root',
    group => 'root',
    require => Package['php5'],
    notify => Service['apache2'],
  }
  
  file { '/var/log/php':
    ensure => 'directory',
    owner => 'vagrant',
  }
}
