
class supervisor {

  $path="/bin:/usr/bin"

  $configuration_path = "/etc/supervisor/supervisord.conf"

  package { 'python-setuptools':
    ensure => installed,
  }
  ->
  exec { 'install-supervisor':
    command => 'easy_install supervisor',
    path => $path,
  }
  ->
  file { "/var/log/supervisord":
    ensure => 'directory',
  }
  ->
  file { "/etc/init.d/supervisor":
    ensure => 'file',
    content => template('supervisor/supervisor.erb'),
    mode => '755',
  }
  ->
  file { "/etc/supervisor":
    ensure => 'directory'
  }
  ->
  file { "$configuration_path":
    ensure => 'file',
    content => template('supervisor/supervisor.conf.erb'),
  }
  ->
  exec { "ln -s /usr/local/bin/supervisord /usr/bin/supervisord":
    path => $path,
  }
  ->
  exec { "ln -s /usr/local/bin/supervisorctl /usr/bin/supervisorctl":
    path => $path,
  }

  service { 'supervisor':
    ensure => running,
    enable => true,
  }

}
