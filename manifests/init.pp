# == Class: grafana
#
# This class downloads and installs grafana.
# SHOULD NOT be called directly.
#
# === Parameters
#
# None.
#
class grafana (
  $version            = '1.6.1',
  $install_dir        = '/opt',
  $graphite_host      = 'localhost',
  $graphite_port      = 80,
  $elasticsearch_host = undef,
  $elasticsearcg_port = 9200,
  $influxdb_host      = undef,
  $influxdb_port      = 8086,
  $influxdb_dbpath    = '/db/grafana',
  $influxdb_user      = 'admin',
  $influxdb_pass      = 'admin',
  $timezone           = '0000',
  $playlist_timespan  = '1m'
) {

  # The anchor resources allow the end user to establish relationships
  # to the "main" class and preserve the relationship to the
  # implementation classes through a transitive relationship to
  # the composite class.
  # https://projects.puppetlabs.com/projects/puppet/wiki/Anchor_Pattern
  anchor { 'grafana::begin':}->
  class { $::grafana::install: }->
  class { $::grafana::config: }->
  anchor { 'grafana::end':}
}
