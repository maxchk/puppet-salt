class salt::minion::service {
  service { 'salt-minion':
    ensure   => 'running',
    enable   => true,
    provider => $salt::defaults::service_provider,
  }
}
