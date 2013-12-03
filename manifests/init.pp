# == Class: salt
#
# Install, configure and manage SaltStack.
#
# === Parameters
# for master and minion by default all parameters set to undef
# this allows to apply following logic in a template
# <% if @minion_master -%>
# master: <%= @minion_master %>
# <% else -%>
# #master: salt
# <% end -%>
#
# this makes crafting templates a simple matter of running
# few lines bash script :)
#
# ==== Minion parameters
# all minion specific parameters start with 'minion_' prefix
#
# [*minion_master*]
#   is equivalent to salt-minion conf option: master
#
# [*minion_master_port*]
#   is equivalent to salt-minion conf option: master_port
#
# ==== Master parameters
# all master specific parameters start with 'master_' prefix
#
# [*master_interface*]
#   is equivalent to salt-master conf option: interface
#
# [*master_publish_port*]
#   is equivalent to salt-master conf option: publish_port
#
# and so on
# For both master and minon only primary configuration options are available
# If you need more, you probably won't be using Puppet at that point
#
# ==== Module parameters
#
# module related parameters:
# [*master*]
#   Defines if to install salt-master, can be true or false
#   default value: false
#
# [*version*]
#   Which version of package to install,can be present, latest,
#   absent or <version>
#   default value: present
#
# [*manage_repo*]
#   Set to true if you want to make use of the yum/apt repos
#   as managed in the salt::repos class in this module.
#   Requires either the example42 apt module or yum module, as appropriate.
#   default value: false
#
# [*facter_include*]
#   If to make facts into grains.
#   It runs facter and saves output in /etc/salt/grains file in a following format:
#     facter:
#       fact1: 
#         - value1
#       fact2: 
#         - value2
#      ... and so on
#
#   To target, just use -G 'facter:name:value'
#   default value: false
#   NOTE: if you already have /etc/salt/grains file non empty 
#         do not use this option, as it will override its content
#
# [*master_conf_file*]
#   Configuration file for salt master
#
# [*minion_conf_file*]
#   Configuration file for salt minion
#
# [*master_conf_template*]
#   Template file for salt master
#
# [*minion_conf_template*]
#   Template file for salt minion
#
#
# === Examples
#
# install salt (minion only)
#include salt
#
# install salt (minion only) and set minion
# option 'master' to 'salt-master.example.com'
#class {'::salt':
#  minion_master => 'salt-master.example.com',
#}
#
# install salt (master and minion) and set minion
# option 'master' to 'salt-master.example.com'
#class {'::salt':
#  master        => true,
#  minion_master => 'salt-master.example.com',
#}

class salt (
  $master                          = false,
  $version                         = present,
  $manage_repo                     = false,
  $facter_include                  = false,
  $master_conf_file                = $salt::defaults::master_conf_file,
  $minion_conf_file                = $salt::defaults::minion_conf_file,
  $master_conf_template            = $salt::defaults::master_conf_template,
  $minion_conf_template            = $salt::defaults::minion_conf_template,
  $master_interface                = undef,
  $master_publish_port             = undef,
  $master_user                     = undef,
  $master_max_open_files           = undef,
  $master_worker_threads           = undef,
  $master_ret_port                 = undef,
  $master_pidfile                  = undef,
  $master_root_dir                 = undef,
  $master_pki_dir                  = undef,
  $master_cachedir                 = undef,
  $master_keep_jobs                = undef,
  $master_job_cache                = undef,
  $master_minion_data_cache        = undef,
  $master_sock_dir                 = undef,
  $minion_master                   = undef,
  $minion_master_port              = undef,
  $minion_user                     = undef,
  $minion_pidfile                  = undef,
  $minion_root_dir                 = undef,
  $minion_pki_dir                  = undef,
  $minion_id                       = undef,
  $minion_append_domain            = undef,
  $minion_cachedir                 = undef,
  $minion_verify_env               = undef,
  $minion_cache_jobs               = undef,
  $minion_sock_dir                 = undef,
  $minion_backup_mode              = undef,
  $minion_acceptance_wait_time     = undef,
  $minion_random_reauth_delay      = undef,
  $minion_acceptance_wait_time_max = undef,
  $minion_dns_check                = undef,
  $minion_ipc_mode                 = undef,
  $minion_tcp_pub_port             = undef,
  $minion_tcp_pull_port            = undef,
) inherits salt::defaults {

  # Repo management
  if $manage_repo {
    include salt::repo
  }

  # salt-master
  if $master {
    class {'salt::master':}
  }

  # salt-minion
  $grains_file = $salt::defaults::grains_file
  class {'salt::minion':}
}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

