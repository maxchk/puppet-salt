# Class salt::repo
# Set up the package repo for rpm/deb based distros
class salt::repo {
  case $::osfamily {
    /(Debian|Ubuntu)/: {
      include salt::repo::deb
    }
    /(Redhat|Centos)/: {
      include salt::repo::rpm
    }
    default: {
      fail("${::osfamily} is not yet supported. Add it and send a pull request!")
    }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

