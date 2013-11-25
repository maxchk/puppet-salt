class salt::defaults {

  # set location of conf file for master
  #
  $master_conf_file = $::operatingsystem ? {
    default => '/etc/salt/master',
  }

  # set location of conf file for minion
  #
  $minion_conf_file = $::operatingsystem ? {
    default => '/etc/salt/minion',
  }

  # set templates for master and minion
  #
  $master_conf_template = 'salt/master.erb'
  $minion_conf_template = 'salt/minion.erb'

}
