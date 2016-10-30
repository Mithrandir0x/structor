
class storm_base {

  require supervisor

  if ($hdp_version_major+0 >= 2 and $hdp_version_minor+0 >= 5) {
    $storm_yaml_template = 'storm_base/storm.new.yaml.erb'
  } else {
    $storm_yaml_template = 'storm_base/storm.yaml.erb'
  }

  package { "storm${package_version}":
    ensure => installed,
  }
  ->
  file { "/etc/storm/conf/storm.yaml":
    ensure => "present",
    content => template("${storm_yaml_template}"),
  }

}
