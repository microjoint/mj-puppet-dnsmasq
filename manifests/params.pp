class dnsmasq::params {

  $resolve              = false
  $poll                 = true

  case $::osfamily {
    'Archlinux': {
      $config          = '/etc/dnsmasq.conf'
      $package_name    = [ 'dnsmasq' ]
      $service_name    = 'dnsmasqd'
    }
    'Debian': {
      $config          = '/etc/dnsmasq.conf'
      $package_name    = [ 'dnsmasq' ]
      $service_name    = 'dnsmasq'
    }
    'Linux': {
      # Account for distributions that don't have $::osfamily specific settings.
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
