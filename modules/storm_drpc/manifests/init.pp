
class storm_drpc {
  
  require storm_base

  $path="/bin:/usr/bin"

  $srv = 'drpc'
  $conf_file = "/tmp/supervisor.program.storm.${srv}.conf"

  file { "$conf_file":
    ensure => file,
    content => template("storm_drpc/program.${srv}.erb"),
    mode => 'a+rx',
  }
  ->
  exec { 'add-storm-nimbus-supervisor-program':
    command => "cat $conf_file >> ${supervisor::configuration_path}",
    path => $path,
  }

}
