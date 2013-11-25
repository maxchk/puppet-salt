class salt::minion::install {
  package { 'salt-minion':
    ensure => $salt::version,
  }
}
