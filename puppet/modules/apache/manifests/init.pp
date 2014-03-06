class apache {
  package { 'apache2':
    require => Exec['apt-get update'],
    ensure => 'present',
  }
  
  file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure => 'link',
    target => '/etc/apache2/mods-available/rewrite.load',
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
    notify => Service['apache2'],
  }
  
  file { '/etc/apache2/sites-available/default':
    ensure => 'present',
    source => 'puppet:///modules/apache/default',
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
    notify => Service['apache2'],
  }
  
  file { '/etc/apache2/apache2.conf':
    ensure => 'present',
    source => 'puppet:///modules/apache/apache2.conf',
    owner => 'root',
    group => 'root',
    require => Package['apache2'],
    notify => Service['apache2'],
  }

  service { 'apache2':
    ensure => 'running',
    require => Package['apache2'],
  }
}
