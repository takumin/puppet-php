define php::extension (
  $ensure = present,
  $package = undef,
) {
  if $package {
    package { $package:
      ensure => $ensure,
    }
    if defined(Class['::php_fpm']) {
      Package[$package] {
        notify => Class['::php_fpm::service'],
      }
    }
  }
}
