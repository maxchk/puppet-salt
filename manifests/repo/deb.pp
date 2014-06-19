# Class salt::repo::deb
# Handle .deb based distributions' repositories for Saltstack
# Requires Puppetlabs apt modules!
class salt::repo::deb {
  include apt

  case $::operatingsystem {
    'Ubuntu': { # http://docs.saltstack.com/topics/installation/ubuntu.html
      apt::ppa { 'ppa:saltstack/salt': }
    }
    'Debian': { # http://docs.saltstack.com/topics/installation/debian.html
      $deb_base_url   = 'http://debian.saltstack.com/debian'
      $deb_key        = 'F2AE6AB9'
      $deb_key_source = 'http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key'
      case $::lsbdistcodename {
        /(squeeze|wheezy|jessie)/: {
          apt::source {'saltstack':
            location   => $deb_base_url,
            release    => "${::lsbdistcodename}-saltstack",
            repos      => 'main',
            key        => $deb_key,
            key_source => $deb_key_source,
          }
        }
        'sid': {
          apt::soruce {'saltstack':
            location   => $deb_base_url,
            release    => 'unstable',
            repos      => 'main',
            key        => $deb_key,
            key_source => $deb_key_source,
          }
        }
        default  : { fail("${::lsbdistcodename} is not yet supported, Add it and send a pull request!") }
      }
    }
    default: { fail("${::operatingsystem} is not yet supported, Add it and send a pull request!") }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

