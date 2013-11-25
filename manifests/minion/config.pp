class salt::minion::config {
  file { 'minion-conf':
    ensure  => present,
    path    => $salt::minion_conf_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($salt::minion_conf_template),
  }
}
