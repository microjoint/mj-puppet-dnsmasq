class dnsmasq (
  $config            = $dnsmasq::params::config,
  $config_template   = $dnsmasq::params::config_template,
  $package_ensure    = $dnsmasq::params::package_ensure,
  $package_name      = $dnsmasq::params::package_name,
  $service_enable    = $dnsmasq::params::service_enable,
  $service_ensure    = $dnsmasq::params::service_ensure,
  $service_manage    = $dnsmasq::params::service_manage,
  $service_name      = $dnsmasq::params::service_name,
) inherits dnsmasq::params {

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  include '::dnsmasq::install'
  include '::dnsmasq::config'
  include '::dnsmasq::service'

  Class['::dnsmasq::install'] -> Class['::dnsmasq::config'] ~> Class['::dnsmasq::service']

}
