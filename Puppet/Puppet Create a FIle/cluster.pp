lass create_file {

    file { '/opt/sysops/beta.txt':
      ensure  => 'present',
      replace => 'no', # this is the important property
      content => "",
      mode    => '0644',
    }

}
node 'stapp02.stratos.xfusioncorp.com'{


include create_file
}
