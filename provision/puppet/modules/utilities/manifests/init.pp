# Class: utilities
#
#
class utilities {
    package { 'tree' :
        ensure => present,        
    }

    package { 'git' :
        ensure => present,
    }
}