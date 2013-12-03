# install for master
class salt::master::install {
  package { 'salt-master':
    ensure => $salt::version,
  }
}
