
package { 'java' :
    ensure => 'present',
}

package { 'puppetserver' :
    ensure => 'present',
}

package { 'puppet-agent' :
    ensure => 'present',
}