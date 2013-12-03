# config for master
class salt::master::config {
  file { 'master-conf':
    ensure  => present,
    path    => $salt::master_conf_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($salt::master_conf_template),
  }
}
