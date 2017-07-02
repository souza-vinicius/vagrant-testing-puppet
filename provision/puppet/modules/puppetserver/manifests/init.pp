class puppetserver {

    package { 'puppetserver' :
        ensure => 'present',
    }

    file { '/etc/sysconfig/puppetserver' :
        ensure  => 'file',
        group   => '0',
        mode    => '0644',
        owner   => '0',
        source  => 'puppet:///modules/puppetserver/puppetserver',
        require => Package[ 'puppetserver'],
        notify  => Service[ 'puppetserver' ],
        
    }

    # TODO => Configurar o AUTOSIGN
    #
    #
    #

    service { 'puppetserver' :
        ensure => 'running',
        enable => true,
        hasrestart => true,
        hasstatus => true,
    }
    
}