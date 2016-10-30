
class storm_base {

  require supervisor

  if ($hdp_version_major+0 >= 2 and $hdp_version_minor+0 >= 5) {
    $STORM_YAML_TEMPLATE = 'storm_base/storm.new.yaml.erb'
  } else {
    $STORM_YAML_TEMPLATE = 'storm_base/storm.yaml.erb'
  }

  package { "storm${package_version}":
    ensure => installed,
  }
  ->
  file { "/etc/storm/conf/storm.yaml":
    ensure => "present",
    content => template("$STORM_YAML_TEMPLATE"),
  }

}
