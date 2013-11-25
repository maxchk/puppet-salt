class salt::master {
  anchor { 'salt::master::begin': } ->
  class { '::salt::master::install': } ->
  class { '::salt::master::config': } ~>
  class { '::salt::master::service': } ->
  anchor { 'salt::master::end': }
}
