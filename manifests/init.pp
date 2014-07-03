# == Class: grafana
#
# This class installs and configures grafana.
#
# === Parameters
#
# [*version*]
#   Version of grafan to be installed.
#   Default is '1.6.1'
# [*install_dir*]
#   Install directory of grafana.
#   Default is '/opt'
# [*graphite_host*]
#   Hostname of graphite server.
#   Default is 'localhost'
# [*graphite_port*]
#   Port of graphite service.
#   Default is 80
# [*elasticsearch_host*]
#   Hostname of elasticsearch. You will need an elasticsearch
#   for saving dashboards
#   Default is '' (empty)
# [*elasticsearch_por*]
#   Port of elasticsearch service.
#   Default is 9200
# [*influxdb_host*]
#   Hostname of influxdb.
#   Default is '' (empty)
# [*influxdb_port*]
#   Port of influxdb.
#   Default is 8086
# [*influxdb_dbpath*]
#   DB path of influxdb.
#   Default is '/db/grafana'
# [*influxdb_user*]
#   Name of db user.
#   Default is 'grafana'
# [*influxdb_pass*]
#   Password of db user.
#   Default is 'grafana'
# [*timezone_offset*]
#   If you experiance problems with zoom, it is probably caused by timezone diff between
#   your browser and the graphite-web application. timezoneOffset setting can be used to have Grafana
#   translate absolute time ranges to the graphite-web timezone.
#   Example:
#     If TIME_ZONE in graphite-web config file local_settings.py is set to America/New_York, then set
#     timezoneOffset to "-0500" (for UTC - 5 hours)
#   Example:
#     If TIME_ZONE is set to UTC, set this to "0000"
#   Default is '0000'
# [*playlist_timespan*]
#   Playlist timespan.
#   Default is '1m'
#
class grafana (
  $version            = '1.6.1',
  $install_dir        = '/opt',
  $graphite_host      = 'localhost',
  $graphite_port      = 80,
  $elasticsearch_host = '',
  $elasticsearch_port = 9200,
  $influxdb_host      = '',
  $influxdb_port      = 8086,
  $influxdb_dbpath    = '/db/grafana',
  $influxdb_user      = 'grafana',
  $influxdb_pass      = 'grafana',
  $timezone_offset    = '0000',
  $playlist_timespan  = '1m'
) {

  # The anchor resources allow the end user to establish relationships
  # to the "main" class and preserve the relationship to the
  # implementation classes through a transitive relationship to
  # the composite class.
  # https://projects.puppetlabs.com/projects/puppet/wiki/Anchor_Pattern
  anchor { 'grafana::begin': }->
  class { 'grafana::install': }->
  class { 'grafana::config': }->
  anchor { 'grafana::end': }
}
