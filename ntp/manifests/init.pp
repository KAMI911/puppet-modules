class ntp {
      case $operatingsystem {
        centos, redhat: {
          $service_name = 'ntp'
          $conf_file    = 'ntp.conf'
          $package_name = 'ntp'
        }
        SLES: {
          $service_name = 'ntp'
          $conf_file    = 'ntp.conf'
          $package_name = 'ntp'
        }
        debian, ubuntu: {
          $service_name = 'ntp'
          $conf_file    = 'ntp.conf'
          $package_name = 'ntp'
        }
      }

      package { "$package_name":
        ensure => installed,
      }

      file { 'ntp.conf':
        path    => "/etc/$conf_file",
        ensure  => file,
        require => Package["$package_name"],
        source  => "puppet:///modules/ntp/${conf_file}"
      }

      service { 'ntp':
        name      => $service_name,
        ensure    => running,
        enable    => true,
        subscribe => File['ntp.conf'],
      }
    }
