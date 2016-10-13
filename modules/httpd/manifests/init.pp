#  Licensed to the Apache Software Foundation (ASF) under one or more
#   contributor license agreements.  See the NOTICE file distributed with
#   this work for additional information regarding copyright ownership.
#   The ASF licenses this file to You under the Apache License, Version 2.0
#   (the "License"); you may not use this file except in compliance with
#   the License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

class httpd {

  if ($operatingsystem == "centos") {
    $http_service = "httpd"
  } else {
    $http_service = "apache2"
  }

  package { "$http_service":
    ensure => installed,
  }

  service { "$http_service":
    ensure => running,
    enable => true,
    require => Package["$http_service"],
  }

  file { "/var/www/html/index.html":
    ensure => file,
    content => template('httpd/index.html.erb'),
    require => Package["$http_service"],
  }
}
