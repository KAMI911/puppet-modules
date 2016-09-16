class sysctl-performance {
      case $operatingsystem {
        debian, ubuntu: {
          $conf_file    = '99-performance.conf'
          $conf_path    = '/etc/sysctl.d'

      file { 'sysctl-performance':
        path    => "${conf_path}/${conf_file}",
        ensure  => file,
        audit   => content,
        mode    => 640,
        owner   => "root",
        group   => "root",
        source  => "puppet:///modules/sysctl-performance/${conf_file}",
        notify  => Exec['update_sysctl'],
      }

    exec { 'update_sysctl':
        command     => '/sbin/start procps',
        onlyif      => '/usr/bin/test -r /etc/init/procps.conf',
        refreshonly => true,
    }
    } 
  }

}
