# == Class: apt_extras::dotdeb
#
class apt_extras::dotdeb {

  Apt::Source <| title == 'dotdeb' |> -> Package <| |>

  apt::key { 'dotdeb':
    key               => '6572BBEF1B5FF28B28B706837E3F070089DF5277',
    key_source        => 'http://www.dotdeb.org/dotdeb.gpg',
  }
  apt::source { 'dotdeb':
    location          => 'http://packages.dotdeb.org',
    release           => $::lsbdistcodename,
    repos             => 'all',
    required_packages => 'debian-keyring debian-archive-keyring',
    require           => Apt::Key['dotdeb'],
    notify            => Exec['apt-get-update'],
  }

}

