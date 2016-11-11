# == Class: apt_extras::contrib
#
class apt_extras::contrib {

  Apt::Source <| title == 'contrib' |> -> Package <| |>

  apt::source { 'contrib':
    location          => 'http://ftp.es.debian.org/debian/',
    release           => $::lsbdistcodename,
    repos             => 'contrib',
    required_packages => 'debian-keyring debian-archive-keyring',
    notify            => Exec['apt-get-update'],
  }

}

