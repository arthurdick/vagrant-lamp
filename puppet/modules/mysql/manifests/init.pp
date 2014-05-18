class mysql {
  package { 'mysql-server':
    require => Exec['apt-get update'],
    ensure => 'present',
  }
  
  package { 'mysql-client':
    require => Exec['apt-get update'],
    ensure => 'present',
  }

  service { 'mysql':
    ensure => 'running',
    require => Package['mysql-server'],
  }
}
