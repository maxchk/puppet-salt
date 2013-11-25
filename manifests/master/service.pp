class salt::master::service {
  service { 'salt-master':
    ensure => 'running',
    enable => true,
  }
}
