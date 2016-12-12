# Class salt::repo::deb
# Handle .deb based distributions' repositories for Saltstack
# Requires Puppetlabs apt modules!
class salt::repo::deb {
  include apt

  case $::operatingsystem {
    'Ubuntu': {
      $os_string = $::os['release']['full']
      apt::source {'saltstack':
        location   => "http://repo.saltstack.com/apt/ubuntu/${os_string}/amd64/2016.11",
        release    => "${::lsbdistcodename}",
        repos      => 'main',
        key        => 'DE57BFBE',
        key_source => "https://repo.saltstack.com/apt/ubuntu/${os_string}/amd64/2016.11/SALTSTACK-GPG-KEY.pub",
      }
    }
    'Debian': {
      $os_string = $::os['release']['major']
      apt::source {'saltstack':
        location   => "http://repo.saltstack.com/apt/debian/${os_string}/amd64/2016.11",
        release    => "${::lsbdistcodename}",
        repos      => 'main',
        key        => 'DE57BFBE',
        key_source => "https://repo.saltstack.com/apt/debian/${os_string}/amd64/2016.11/SALTSTACK-GPG-KEY.pub",
      }
    }
    default: { fail("${::operatingsystem} is not yet supported, Add it and send a pull request!") }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent
