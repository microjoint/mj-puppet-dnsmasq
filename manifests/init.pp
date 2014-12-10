class dnsmasq (
  $config_template   = hiera(dnsmasq::config_template, 'dnsmasq/dnsmasq.conf.erb'),
  $package_ensure    = hiera(dnsmasq::package_ensure, 'present'),
  $service_enable    = hiera(dnsmasq::service_enable, true),
  $service_ensure    = hiera(dnsmasq::service_ensure, 'running'),
  $service_manage    = hiera(dnsmasq::service_manage, true),
  $port              = hiera(dnsmasq::port, 53),
  $resolv            = hiera(dnsmasq::resolv, false),
  $resolv_file       = hiera(dnsmasq::resolv_file, '/etc/resolv.dnsmasq'),
  $package_name      = $dnsmasq::params::package_name,
  $config            = $dnsmasq::params::config,
  $service_name      = $dnsmasq::params::service_name,
  $cache_size        = hiera(dnsmasq::cache_size, 2048),

) inherits dnsmasq::params {

  $dns_servers       = hiera_array(dnsmasq::dns_servers)

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  validate_array($dns_servers)

  include '::dnsmasq::install'
  include '::dnsmasq::config'
  include '::dnsmasq::service'

  Class['::dnsmasq::install'] -> Class['::dnsmasq::config'] ~> Class['::dnsmasq::service']

}
