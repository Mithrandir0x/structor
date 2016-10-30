
class storm_supervisor {
  
  require storm_base

  $path="/bin:/usr/bin"

  $srv = 'supervisor'
  $conf_file = "/tmp/supervisor.program.storm.${srv}.conf"

  file { "$conf_file":
    ensure => file,
    content => template("storm_supervisor/program.${srv}.erb"),
    mode => 'a+rx',
  }
  ->
  exec { 'add-storm-nimbus-supervisor-program':
    command => "cat $conf_file >> ${supervisor::configuration_path}",
    path => $path,
  }

}
