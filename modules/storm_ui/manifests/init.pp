
class storm_ui {
  
  require storm_base

  $path="/bin:/usr/bin"

  $srv = 'ui'
  $conf_file = "/tmp/supervisor.program.storm.${srv}.conf"

  file { "$conf_file":
    ensure => file,
    content => template("storm_ui/program.${srv}.erb"),
    mode => 'a+rx',
  }
  ->
  exec { 'add-storm-ui-supervisor-program':
    command => "cat $conf_file >> ${supervisor::configuration_path}",
    path => $path,
  }

}
