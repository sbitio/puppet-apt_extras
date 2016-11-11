# == Class: apt_extras::lts
#
class apt_extras::lts {

  Apt::Source <| title == 'lts' |> -> Package <| |>

  if ( $::lsbdistcodename == 'squeeze' ) {
    apt::source { 'lts':
      location          => 'http://http.debian.net/debian/',
      release           => "${::lsbdistcodename}-lts",
      repos             => 'main contrib non-free',
      required_packages => 'debian-keyring debian-archive-keyring',
      notify            => Exec['apt-get-update'],
    }
  }

}

