# == Class: apt_extras
#
class apt_extras {

  exec {'apt-get-update':
    command => 'apt-get update',
    refreshonly => true,
  }

}

