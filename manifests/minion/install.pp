class salt::minion::install inherits salt {

  case $::kernel {
    'Linux'   : {
      package { 'salt-minion':
        ensure => $salt::version,
      }
    }
    'Windows' : {
      # puppet file server as msi package source is not supported
      # https://docs.puppetlabs.com/puppet/4.4/reference/resources_package_windows.html
      file { "$salt::temp_installer":
        ensure => present,
        #mode => '0644',
        source => "puppet:///modules/salt/Salt-Minion-2016.3.4-AMD64-Setup.exe",
      } ->
      package { 'salt-minion':
        ensure   => $ensure_setting,
        source   => "$temp_installer",
        install_options => ['/S']
      }
      #exec { 'install_minion_service':
      #  command   => '"C:\ProgramData\PuppetLabs\Salt-Minion-2016.3.4-AMD64-Setup.exe" /S',
      #  unless    => 'C:\\windows\\system32\\cmd.exe /c sc.exe query salt-minion',
      #}
    } # end Windows
    default   : {
      # lint:ignore:80chars
      fail("The Salt-minion module is not yet supported on this ${::kernel}")
      # lint:endignore
    }
  } # end $::kernel case
}
