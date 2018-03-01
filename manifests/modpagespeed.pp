# == Class: apt_extras::mod-pagespeed
#
class apt_extras::mod-pagespeed {

  ensure_packages('apt-transport-https')

  apt::key { 'mod-pagespeed':
    key        => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
    source => 'https://dl.google.com/linux/linux_signing_key.pub',
  }
  apt::source { 'mod-pagespeed':
    location          => 'http://dl.google.com/linux/mod-pagespeed/deb/',
    release           => 'stable',
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    require           => Apt::Key['mod-pagespeed'],
  }

}
