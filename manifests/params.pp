# == Class php::params
#
# This class is meant to be called from php.
# It sets variables according to platform.
#
class php::params {
  case $::osfamily {
    'Debian', 'RedHat', 'Amazon': {
      $package_name    = 'php'
      $prefix          = ''
    }
    'FreeBSD': {
      $package_name    = 'lang/php5'
      $prefix          = '/usr/local'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $config          = "$prefix/etc/php.ini"
  $config_template = 'php/php.ini.erb'
}
