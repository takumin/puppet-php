define php::extension (
  $ensure = present,
  $package = undef,
) {
  if $package {
    package { $package:
      ensure => $ensure,
    }
  }
}
