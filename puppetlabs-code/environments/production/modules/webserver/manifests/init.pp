class webserver {
    if $::osfamily == 'RedHat' {
        package { 'httpd':
            ensure => present
        }

        file { '/etc/httpd/conf/httpd.conf':
          ensure  => file,
          source  => 'puppet:///modules/webserver/httpd.conf',
          require => Package['httpd'],
        }

        file { '/etc/httpd/conf.d/vhost.conf':
          ensure  => file,
          content => template('webserver/vhost.conf.erb'),
          require => Package['httpd'],
        }

        service { 'httpd':
            ensure     => running,
            enable     => true,
            hasrestart => true,
            hasstatus  => true,
            # pattern    => 'httpd',
            require    => [ File['/etc/httpd/conf/httpd.conf'], File['/etc/httpd/conf/httpd.conf'] ]
        }
    } else {
        if $::osfamily == 'Debian' {
            package { 'apache2':
                ensure => present
            }
            service { 'apache2':
                ensure     => running,
                enable     => true,
                hasrestart => true,
                hasstatus  => true,
                # pattern    => 'apache2',
            }
        }
    }
}
