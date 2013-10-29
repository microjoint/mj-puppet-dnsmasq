class dnsmasq::params {

  $config_template      = 'dnsmasq/dnsmasq.conf.erb'
  $package_ensure       = 'present'
  $service_enable       = true
  $service_ensure       = 'running'
  $service_manage       = true
  $port                 = 5353
  $resolve              = true
  $resolv_file          = '/etc/resolv.conf'
  $poll                 = true
  $servers              = [
    '8.8.8.8',
    '8.8.4.4',
    '80.58.61.254',
    '80.58.61.250',
  ]

  case $::osfamily {
    'Archlinux': {
      $config          = '/etc/dnsmasq.conf'
      $package_name    = [ 'dnsmasq' ]
      $service_name    = 'dnsmasqd'
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
