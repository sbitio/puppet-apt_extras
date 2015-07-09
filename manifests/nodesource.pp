# == Class: apt_extras::nodesource
#
# Based on https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
class apt_extras::nodesource {

  Apt::Source <| title == 'nodesource' |> -> Class['nodejs']

  ensure_packages('apt-transport-https')

  apt::key { 'nodesource':
    key        => '9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280',
    key_source => 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key',
    #require    => Package['apt-transport-https'],
  }
  apt::source { 'nodesource':
    location          => 'https://deb.nodesource.com/node',
    release           => $::lsbdistcodename,
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    require           => Apt::Key['nodesource'],
  }

}

