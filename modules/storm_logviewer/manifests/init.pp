
class storm_logviewer {
  
  require storm_base

  $path="/bin:/usr/bin:/sbin"

  $srv = 'logviewer'
  $conf_file = "/tmp/supervisor.program.storm.${srv}.conf"

  file { "$conf_file":
    ensure => file,
    content => template("storm_logviewer/program.${srv}.erb"),
    mode => 'a+rx',
  }
  ->
  exec { 'add-storm-logviewer-supervisor-program':
    command => "cat $conf_file >> ${supervisor::configuration_path}",
    path => $path,
  }

}
