class dnsmasq::install inherits dnsmasq {

  package { 'dnsmasq':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
