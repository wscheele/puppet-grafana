#grafana

####Table of Contents

1. [Overview - What is the grafana module?](#overview)
2. [Module Description - What does this module do?](#module-description)
3. [Setup - The basics of getting started with grafana](#setup)
    * [Beginning with grafana - Installation](#beginning-with-grafana)
4. [Usage - The class and available configurations](#usage)
7. [Requirements](#requirements)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Contributing to the grafana module](#contributing)

##Overview

This module installs and configures for grafana.

##Module Description

[Grafana](http://http://grafana.org/) is an open source, metrics dashboard and graph editor for Graphite, InfluxDB and OpenTSDB.

This module is intended to be used in combination with [puppet-graphite](https://forge.puppetlabs.com/dwerder/graphite). At the
moment you will need modules like apache or nginx to configure the webservices which will serve the grafana scripts.

##Setup

**What grafana affects:**

* dowloads/installs/configures grafana

###Beginning with Grafana

Install Grafana with default parameters. In this case grafana will be 
installed at /opt/grafana and it will listen on localhost:80 for a graphite
server. You will also need the apache module (or nginx, etc.)

Here we configure Apache 2.2 with Grafana on port 8080.
```puppet

  class { 'apache': default_vhost => false }
    
  apache::vhost { 'my.grafana.domain':
    servername      => 'my.grafana.domain',
    port            => 8080,
    docroot         => '/opt/grafana',
    error_log_file  => 'grafana_error.log',
    access_log_file => 'grafana_access.log',
    directories     => [
      {
        path            => '/opt/grafana',
        options         => [ 'None' ],
        allow           => 'from All',
        allow_override  => [ 'None' ],
        order           => 'Allow,Deny',
      }
    ]
  }->
  class { 'grafana': }
```

##Requirements

###Modules needed:

stdlib by puppetlabs

###Modules recommend:

[puppet-graphite](https://github.com/echocat/puppet-graphite) for graphite installation.

##Limitations

This module is tested on CentOS 6.5 and Debian 7 (Wheezy) and should also run without problems on

* RHEL/CentOS/Scientific 6+
* Debian 6+
* Ubunutu 10.04 and newer

This module provides only the Grafana installation and config. The webservice to serve Grafana has to be realized with modules like apache.

##Contributing

Echocat modules are open projects. So if you want to make this module even better, you can contribute to this module on [Github](https://github.com/echocat/puppet-grafana).