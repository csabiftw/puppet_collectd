class collectd::plugins::mysql (
  $modules,
)  {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'mysql':
    package_name     => 'collectd-mysql',
    config_file_name => '10-mysql.conf',
    config_template  => 'collectd/plugins/mysql/mysql.conf.erb',
    modules          => $modules,
  }
}
