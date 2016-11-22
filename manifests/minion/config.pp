class salt::minion::config inherits salt {
  file { "$salt::minion_conf_file":
    ensure  => present,
    path    => $salt::minion_conf_file,
    owner   => $salt::user,
    group   => $salt::group,
    mode    => '0644',
    content => template($salt::minion_conf_template),
  }

  if $salt::facter_include {
    file { "$salt::grains_file":
      ensure  => present,
      path    => $salt::grains_file,
      owner   => $salt::user,
      group   => $salt::group,
      mode    => '0644',
      content => template('salt/grains.erb'),
    }
  }
}
