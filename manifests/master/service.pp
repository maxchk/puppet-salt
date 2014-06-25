# service for salt master
class salt::master::service {
  service { 'salt-master':
    ensure   => 'running',
    enable   => true,
    provider => $salt::defaults::service_provider,
  }
}
