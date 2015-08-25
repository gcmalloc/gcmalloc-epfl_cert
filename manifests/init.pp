# == Class: epfl_cert
#
# Full description of class epfl_cert here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'epfl_cert':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
define epfl_cert (
  $server_name=$name,
  $unit=undef,
  $email=undef,
  $altname=[],
  $commonname=$::fqdn,
  $state_enabled=false){

    validate_re($commonname, '^[^.]+[.]epfl[.]ch$')
    validate_string($server_name)

    if $unit != undef {
      validate_re($unit, '^[A-Z-] $')
    }

    validate_bool($state_enabled)
    if $state_enabled {
      $state = 'VD'
    } else {
      $state = undef
    }

    openssl::certificate::x509 {$server_name:
      country      => 'CH',
      organisation => 'Ecole polytechnique federale de Lausanne (EPFL)',
      commonname   => $commonname,
      state        => $state,
      email        => $email,
      unit         => $unit,
      cnf_tpl      => 'modules/epfl_cert'
    }
}
