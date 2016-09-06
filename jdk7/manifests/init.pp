class jdk7 {
      case $operatingsystem {
        centos, redhat: {
          $package_name = [ 'oracle-jdk7-installer', 'oracle-java7-installer' ]
          $repository = 'ppa:webupd8team/java'
        }
        SLES: {
          $package_name = [ 'oracle-jdk7-installer', 'oracle-java7-installer' ]
          $repository = 'ppa:webupd8team/java'
        }
        debian, ubuntu: {
          $package_name = [ 'oracle-jdk7-installer', 'oracle-java7-installer' ]
          $repository = 'ppa:webupd8team/java'
        }
      }

     exec { 'set-oracle-licence-selected':
       command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections',
       creates => '/var/lib/dpkg/info/oracle-jdk7-installer.list'
     }

      exec { 'java_repository':
        command => "/usr/bin/apt-add-repository $repository; /usr/bin/apt-get update",
        creates => "/etc/apt/sources.list.d/webupd8team-java-${lsbdistcodename}.list",
        require => Exec['set-oracle-licence-selected'],
      }

      package { $package_name:
        ensure   => installed,
        require  => Exec['java_repository']
      }
    }
