class salt::minion::service {
  service { 'salt-minion':
    ensure => 'running',
    enable => true,
  }
}
