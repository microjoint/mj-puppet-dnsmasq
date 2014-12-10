#mj-puppet-dnsmasq

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dnsmasq](#setup)
    * [What dnsmasq affects](#what-dnsmasq-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dnsmasq](#beginning-with-dnsmasq)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The Dnsmasq module installs, configures and manages the dnsmasq service.

##Module Description

The Dnsmasq module handles running dnsmasq across a range of operating systems and
distributions.

##Setup

###What dnsmasq affects

* dnsmasq package.
* dnsmasq configuration file.
* dnsmasq service.

###Beginning with dnsmasq

include '::dnsmasq' is enough to get you up and running.

##Usage

All interaction with the dnsmasq module can do be done through the main dnsmasq class.
This means you can simply toggle the options in the dnsmasq class to get at the
full functionality.

###I just want dnsmasq, what's the minimum I need?

```puppet
include '::dnsmasq'
```

###I'd like to opt out of having the service controlled, we use another tool for that.

```puppet
class { '::dnsmasq':
  manage_service => false,
}
```
##Reference

###Classes

* dnsmasq: Main class, includes all the rest.
* dnsmasq::install: Handles the packages.
* dnsmasq::config: Handles the configuration file.
* dnsmasq::service: Handles the service.

###Parameters

The following parameters are available in the dnsmasq module

####`config`

This sets the file to write dnsmasq configuration into.

####`config_template`

This determines which template puppet should use for the dnsmasq configuration.

####`package_ensure`

This can be set to 'present' or 'latest' or a specific version to choose the
dnsmasq package to be installed.

####`package_name`

This determines the name of the package to install.

####`service_enable`

This determines if the service should be enabled at boot.

####`service_ensure`

This determines if the service should be running or not.

####`service_manage`

This selects if puppet should manage the service in the first place.

####`service_name`

This selects the name of the dnsmasq service for puppet to manage.


##Limitations

The module has been tested on:

* Arch Linux
* Debian
