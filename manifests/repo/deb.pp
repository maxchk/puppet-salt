# Class salt::repo::deb
# Handle .deb based distributions' repositories for Saltstack
# Requires Puppetlabs apt modules!
class salt::repo::deb {
  include apt

  case $::operatingsystem {
    'Ubuntu': {
      case $::lsbdistcodename {
        'precise': {
          apt::source {'saltstack':
            location   => 'http://repo.saltstack.com/apt/ubuntu/12.04/amd64/2016.3',
            release    => "${::lsbdistcodename}",
            repos      => 'main',
            key        => 'DE57BFBE',
            key_source => 'https://repo.saltstack.com/apt/ubuntu/12.04/amd64/2016.3/SALTSTACK-GPG-KEY.pub',
          }
        }
        'trusty': {
          apt::source {'saltstack':
            location   => 'http://repo.saltstack.com/apt/ubuntu/14.04/amd64/2016.3',
            release    => "${::lsbdistcodename}",
            repos      => 'main',
            key        => 'DE57BFBE',
            key_source => 'https://repo.saltstack.com/apt/ubuntu/14.04/amd64/2016.3/SALTSTACK-GPG-KEY.pub',
          }
        }
        'xenial': {
          apt::source {'saltstack':
            location   => 'http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3',
            release    => "${::lsbdistcodename}",
            repos      => 'main',
            key        => 'DE57BFBE',
            key_source => 'https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3/SALTSTACK-GPG-KEY.pub',
          }
        }
      }
    }
    'Debian': {
      case $::lsbdistcodename {
        'wheezy': {
          apt::source {'saltstack':
            location   => 'http://repo.saltstack.com/apt/debian/7/amd64/archive/2016.3.1',
            release    => "${::lsbdistcodename}",
            repos      => 'main',
            key        => 'DE57BFBE',
            key_source => 'http://repo.saltstack.com/apt/debian/7/amd64/archive/2016.3.1/SALTSTACK-GPG-KEY.pub',
          }
        }
        'jessie': {
          apt::source {'saltstack':
            location   => 'http://repo.saltstack.com/apt/debian/8/amd64/2016.3',
            release    => "${::lsbdistcodename}",
            repos      => 'main',
            key        => 'DE57BFBE',
            key_source => 'https://repo.saltstack.com/apt/debian/8/amd64/2016.3/SALTSTACK-GPG-KEY.pub',
          }
        }
        default  : { fail("${::lsbdistcodename} is not yet supported, Add it and send a pull request!") }
      }
    }
    default: { fail("${::operatingsystem} is not yet supported, Add it and send a pull request!") }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent
