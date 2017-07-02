# Class: utilities
#
#
class vim {

    $username = 'vagrant'
    $userpath = "/home/${username}/"
    $rootpath = "/root/"
    
    package { 'vim':
        ensure => present,        
    }



    file { "${userpath}/.vim/" :
        ensure => directory,
        owner  => vagrant,
        group  => vagrant,
        source => 'puppet:///modules/vim/.vim/',
        recurse => remote,
        require => Package[ 'vim' ],
    }

    file { "${userpath}/.vimrc" :
        ensure => file,
        owner  => vagrant,
        group  => vagrant,
        mode   => '0755',
        source => 'puppet:///modules/vim/.vimrc',
        require => Package[ 'vim' ],
    }
}