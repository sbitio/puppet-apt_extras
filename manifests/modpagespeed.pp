# == Class: apt_extras::modpagespeed
#
class apt_extras::modpagespeed {

  ensure_packages('apt-transport-https')

  apt::key { 'modpagespeed':
    key        => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
    source => 'https://dl.google.com/linux/linux_signing_key.pub',
  }
  apt::source { 'modpagespeed':
    location          => 'http://dl.google.com/linux/mod-pagespeed/deb/',
    release           => 'stable',
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    require           => Apt::Key['modpagespeed'],
  }

}
