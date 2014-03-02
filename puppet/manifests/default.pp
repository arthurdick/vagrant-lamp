Exec {
  path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin',
}
exec { 'apt-get update':
  command => 'apt-get update',
}

include apache
include mysql
include php
include postfix

