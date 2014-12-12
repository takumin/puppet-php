# == Class php::config
#
# This class is called from php for service config.
#
class php::config {
  file { $::php::config:
    owner   => 0,
    group   => 0,
    mode    => 0644,
    content => template($config_template)
  }
}
