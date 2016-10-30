{
  "os": "ubuntu14",
  "hdp_short_version": "2.5.0",
  "java_version": "java-1.8.0-openjdk",
  "vm_mem": 4096,
  "vm_cpus": 1,

  "am_mem": 512,
  "server_mem": 768,
  "client_mem": 1024,

  "security": false,
  "domain": "example.com",
  "realm": "EXAMPLE.COM",

  "storm": {
    "ui_port": 8080,
    "supervisor_slots_ports": [ 6700, 6701, 6702, 6703 ]
  },

  "clients" : [ "hdfs", "yarn", "zk" ],
  "nodes": [
    {"hostname": "nn", "ip": "192.168.59.11",
     "roles": ["client", "nn", "yarn", "yarn-timelineserver", "zk"]},
    {"hostname": "nimbus", "ip": "192.168.59.12",
     "roles": ["client", "storm-nimbus", "zk"]},
    {"hostname": "data1", "ip": "192.168.59.12",
     "roles": ["client", "slave", "storm-supervisor"]}
  ]
}
