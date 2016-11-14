# == Class: apt_extras::nonfree
#
class apt_extras::nonfree {

  Apt::Source <| title == 'non-free' |> -> Package <| |>

  apt::source { 'non-free':
    location          => 'http://ftp.es.debian.org/debian/',
    release           => $::lsbdistcodename,
    repos             => 'non-free',
    required_packages => 'debian-keyring debian-archive-keyring',
  }

}

