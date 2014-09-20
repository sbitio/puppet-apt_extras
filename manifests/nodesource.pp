class apt_extras::nodesource () {
  # based on https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

  Apt::Source <| title == 'nodesource' |> -> Class['nodejs']

  ensure_packages('apt-transport-https')

  apt::key { 'nodesource':
    key        => "68576280",
    key_source => "https://deb.nodesource.com/gpgkey/nodesource.gpg.key",
    #require    => Package['apt-transport-https'],
  }
  apt::source { 'nodesource':
    location          => "https://deb.nodesource.com/node",
    release           => $::lsbdistcodename,
    repos             => "main",
    required_packages => "debian-keyring debian-archive-keyring",
    require           => Apt::Key['nodesource'],
  }

}
