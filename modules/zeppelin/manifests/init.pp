
class zeppelin {

  if ($hdp_version_major+0 >= 2 and $hdp_version_minor+0 >= 5) {
    package { "zeppelin${package_version}":
      ensure => installed,
    }
    ->
    file { "/usr/hdp/current/zeppelin-server/conf/zeppelin-site.xml":
      ensure => "present",
      content => template("zeppelin/zeppelin-site.xml.erb"),
    }
    ->
    file { "/usr/hdp/current/zeppelin-server/conf/zeppelin-env.sh":
      ensure => "present",
      content => template("zeppelin/zeppelin-env.sh.erb"),
    }
  }
  else {
    warning("Zeppelin cannot be installed with an HDP version lower than 2.5.x")
  }

}
