# == Class: apt_extras::backports
#
class apt_extras::backports {
#  apt::key { 'backports':
#    key_source        => 'http://backports.debian.org/debian-backports/dists/squeeze-backports/Release.gpg',
#  }

  require apt::params
  Apt::Source <| title == 'backports' |> -> Package <| |>

  apt::source { 'backports':
    location          => $::lsbdistcodename ? {
      squeeze => 'http://backports.debian.org/debian-backports',
      default => 'http://ftp.debian.org/debian/',
    },
    release           => "${::lsbdistcodename}-backports",
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    notify            => Exec['apt-get-update'],
  }

}

