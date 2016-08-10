class salt::minion::config inherits salt {
  file { 'minion-conf':
    ensure  => present,
    path    => $salt::minion_conf_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($salt::minion_conf_template),
  }

  if $salt::facter_include {
    file { 'grains':
      ensure  => present,
      path    => $salt::grains_file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('salt/grains.erb'),
    }
  }
}
