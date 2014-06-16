class apt_extras::contrib () {

  Apt::Source <| title == 'contrib' |> -> Package <| |>

  apt::source { 'contrib':
    location          => "http://ftp.es.debian.org/debian/",
    release           => $::lsbdistcodenam,
    repos             => "contrib",
    required_packages => "debian-keyring debian-archive-keyring",
  }

}