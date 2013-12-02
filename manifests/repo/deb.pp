# Class salt::repo::deb
# Handle .deb based distributions' repositories for Saltstack
# Requires example42's apt module - https://github.com/example42/puppet-apt
class salt::repo::deb {

  case $::operatingsystem {
    'Ubuntu': { # http://docs.saltstack.com/topics/installation/ubuntu.html
      apt::repository {'saltstack-ppa':
        url        => 'http://ppa.launchpad.net/saltstack/salt/ubuntu',
        distro     => $::lsbdistcodename,
        repository => 'main',
        key        => '0x4759fa960e27c0a6',
        keyserver  => 'keyserver.ubuntu.com',
      }
    }
    'Debian': { # http://docs.saltstack.com/topics/installation/debian.html
      apt::key {'F2AE6AB9':
        url => 'http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key',
      }
      $deb_base_url = 'http://debian.saltstack.com/debian'
      case $::lsbdistcodename {
        /(squeeze|wheezy)/: {
          apt::repository {"${::lsbdistcodename}-saltstack":
            url        => $deb_base_url,
            distro     => $::lsbdistcodename,
            repository => 'main',
          }
        }
        'sid': {
          apt::repository {'sid-saltstack':
            url        => $deb_base_url,
            distro     => 'unstable',
            repository => 'main',
          }
        }
        default  : { fail("${::lsbdistcodename} is not yet supported, Add it and send a pull request!") }
      }
    }
    default: { fail("${::operatingsystem} is not yet supported, Add it and send a pull request!") }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

