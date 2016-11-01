
class storm_drpc {
  
  require storm_base

  $path="/bin:/usr/bin:/sbin"

  $srv = 'drpc'
  $conf_file = "/tmp/supervisor.program.storm.${srv}.conf"

  file { "$conf_file":
    ensure => file,
    content => template("storm_drpc/program.${srv}.erb"),
    mode => 'a+rx',
  }
  ->
  exec { 'add-storm-drpc-supervisor-program':
    command => "cat $conf_file >> ${supervisor::configuration_path}",
    path => $path,
  }
  ->
  exec { "restart_supervisor_drpc_service":
    command => "service supervisor restart",
    path => $path,
  }

}
