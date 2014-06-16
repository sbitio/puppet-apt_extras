class apt_extras::nonfree () {

  Apt::Source <| title == 'non-free' |> -> Package <| |>

  apt::source { 'non-free':
    location          => "http://ftp.es.debian.org/debian/",
    release           => $::lsbdistcodenam,
    repos             => "non-free",
    required_packages => "debian-keyring debian-archive-keyring",
  }

}
