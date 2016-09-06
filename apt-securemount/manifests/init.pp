class apt-securemount {
      case $operatingsystem {
        debian, ubuntu: {
          $conf_file    = '99security-mount'
          $conf_path    = '/etc/apt/apt.conf.d'

      file { 'apt-securemount':
        path    => "${conf_path}/${conf_file}",
        ensure  => file,
        mode    => 644,
        owner   => "root",
        group   => "root",
        source  => "puppet:///modules/apt-securemount/${conf_file}",
      }

      file { 'periodic':
        path    => "${conf_path}/10periodic",
        ensure  => file,
        mode    => 644,
        owner   => "root",
        group   => "root",
        source  => "puppet:///modules/apt-securemount/10periodic",
      }

    } 
  }

}
