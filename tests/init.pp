node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'dnsmasq':
    require => Notify['enduser-before'],
    before  => Notify['enduser-after'],
  }

}
