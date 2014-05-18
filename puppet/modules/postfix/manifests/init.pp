class postfix {
  package { 'postfix':
    require => Exec['apt-get update'],
    ensure => 'present',
  }
  
  package { 'mutt':
    require => Exec['apt-get update'],
    ensure => 'present',
  }
  
  file { '/etc/postfix/main.cf':
    ensure => 'present',
    source => 'puppet:///modules/postfix/main.cf',
    owner => 'root',
    group => 'root',
    require => Package['postfix'],
  }
  
  file { '/etc/postfix/canonical':
    ensure => 'present',
    source => 'puppet:///modules/postfix/canonical',
    owner => 'root',
    group => 'root',
    require => Package['postfix'],
  }
  
  exec { 'postmap':
    command => 'postmap /etc/postfix/canonical',
    require => File['/etc/postfix/canonical'],
  }

  service { 'postfix':
    ensure => 'running',
    require => Package['postfix'],
  }
}


