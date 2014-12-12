# == Class php::config
#
# This class is called from php for service config.
#
class php::config {
  file { $::php::config:
    ensure       => file,
    owner        => 0,
    group        => 0,
    mode         => '0644',
    content      => template($::php::config_template),
    validate_cmd => "$::php::prefix/bin/php -l -c %",
  }
}
