class favoritetools {

  $favoritetools = ['mc', 'htop', 'iptraf', 'byobu' ]
  package { $favoritetools:
    ensure => installed,
  }

}

