node 'stdb01.stratos.xfusioncorp.com' {
    include mysql_database
}

class mysql_database {
    package { 'mariadb-server':
        ensure => installed,
    }
    service { 'mariadb':
        ensure => running,
        enable => true,
    }
    mysql::db { 'kodekloud_db9':
        user => 'kodekloud_pop',
        password => 'ksH85UJjhb',
        host => 'localhost',
        grant => ['ALL']
    }
}
