# == Class: php
#
# Full description of class php here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class php (
  $package_name    = $::php::params::package_name,
  $prefix          = $::php::params::prefix,
  $config          = $::php::params::config,
  $config_template = $::php::params::config_template,
) inherits ::php::params {

  # validate parameters here

  class { '::php::install': } ->
  class { '::php::config': } ~>
  Class['::php']
}
