# minion class
class salt::minion {
  anchor { 'salt::minion::begin': } ->
  class { '::salt::minion::install': } ->
  class { '::salt::minion::config': } ~>
  class { '::salt::minion::service': } ->
  anchor { 'salt::minion::end': }
}
