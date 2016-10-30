
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
  file { "/usr/bin/supervisord":
    ensure => 'directory',
  }
  ->
  file { "/usr/bin/supervisorctl":
    ensure => 'directory',
  }
  ->
  file { "/var/log/supervisord":
    ensure => 'directory',
  }
  ->
  file { "/etc/init.d/supervisor":
    ensure => 'file',
    source => template('supervisor/supervisor.erb'),
  }
  ->
  file { "$configuration_path":
    ensure => 'file',
    source => template('supervisor/supervisor.conf.erb'),
  }

  service { 'supervisor':
    ensure => running,
    enable => true,
  }

}
