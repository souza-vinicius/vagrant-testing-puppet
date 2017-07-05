# Class: utilities
#
#
class vim {

    $username = 'vagrant'
    $rootpath = "/root/"

    $userpath = "/home/${username}/"
    package { 'vim':
        ensure => present,        
    }

    file { ["${userpath}/.vim/", "${rootpath}/.vim"] :
        ensure => directory,
        owner  => vagrant,
        group  => vagrant,
        source => 'puppet:///modules/vim/.vim/',
        recurse => remote,
        require => Package[ 'vim' ],
    }

    file { ["${userpath}/.vimrc", "${rootpath}/.vimrc"] :
        ensure => file,
        owner  => vagrant,
        group  => vagrant,
        mode   => '0755',
        source => 'puppet:///modules/vim/.vimrc',
        require => Package[ 'vim' ],
    }
}