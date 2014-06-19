# Class salt::repo
# Set up the package repo for rpm/deb based distros
class salt::repo {
  # anchor classes for correcect containment
  # (in puppet > 3.4 'contain' would be better/easier)
  anchor{['salt::repo_begin', 'salt::repo_end']: }

  case $::osfamily {
    /(Debian|Ubuntu)/: {
      Anchor['salt::repo_begin']
      -> class{'salt::repo::deb': }
      -> Anchor['salt::repo_end']
    }
    /(Redhat|Centos)/: {
      Anchor['salt::repo_begin']
      -> class{'salt::repo::rpm': }
      -> Anchor['salt::repo_end']
    }
    default: {
      fail("${::osfamily} is not yet supported. Add it and send a pull request!")
    }
  }
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

