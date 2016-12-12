# defaults for salt module
class salt::defaults {

  # Only needed for windows
  $temp_installer = 'C:\ProgramData\PuppetLabs\Salt-Minion-2016.3.4-AMD64-Setup.exe'
  # set location of conf file for master
  #
  $master_conf_file = $::operatingsystem ? {
    default => '/etc/salt/master',
  }

  # set location of conf file for minion
  #
  $minion_conf_file = $::kernel ? {
    'Linux'   => '/etc/salt/minion',
    'Windows' => 'C:\salt\conf\minion',
    default   => '/etc/salt/minion',
  }

  $user = $::kernel ? {
    'Linux'   => 'root',
    'Windows' => 'SYSTEM',
    default   => 'root',
  }
  $group = $::kernel ? {
    'Linux'   => 'root',
    'Windows' => 'administrators',
    default   => 'root',
  }

  # set templates for master and minion
  #
  $master_conf_template = 'salt/master.erb'
  $minion_conf_template = 'salt/minion.erb'

  # set location of grains file
  #
  $grains_file = $::kernel ? {
    'Linux'   => '/etc/salt/grains',
    'Windows' => 'C:\salt\conf\grains',
    default   => '/etc/salt/grains',
  }

  case $::kernel {
    'Linux': {
      case $::operatingsystem {
        /Ubuntu/: {
          # salt only installs init style scripts
          $service_provider = debian
        }
        default: {
          $service_provider = undef
        }
      }
    }
    'Windows': {
      $service_provider = windows
    }
  }
}
