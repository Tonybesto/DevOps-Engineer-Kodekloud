node 'stapp01.stratos.xfusioncorp.com' {
    include tomcat
}

class tomcat {
    package { 'tomcat':
    	ensure => installed,
    }
    service { 'tomcat':
        ensure => running,
	require => Package['tomcat'],
        enable => true,
    }
}
