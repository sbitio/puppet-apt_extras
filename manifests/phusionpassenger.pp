# == Class: apt_extras::phusionpassenger
#
class apt_extras::phusionpassenger {

  ensure_packages('apt-transport-https')

  apt::key { 'phusionpassenger':
    key        => '16378A33A6EF16762922526E561F9B9CAC40B2F7',
    key_server => 'keyserver.ubuntu.com',
  }
  apt::source { 'phusionpassenger':
    location          => 'https://oss-binaries.phusionpassenger.com/apt/passenger',
    release           => $::lsbdistcodename,
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    require           => Apt::Key['phusionpassenger'],
  }

}

