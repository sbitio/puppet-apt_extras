class apt_extras::dotdeb () {

  Apt::Source <| title == 'dotdeb' |> -> Package <| |>

  apt::key { "dotdeb":
    key               => "89DF5277",
    key_source        => "http://www.dotdeb.org/dotdeb.gpg",
  }
  apt::source { 'dotdeb':
    location          => "http://packages.dotdeb.org",
    release           => $::lsbdistcodename,
    repos             => "all",
    required_packages => "debian-keyring debian-archive-keyring",
    require           => Apt::Key['dotdeb'],
  }

}
