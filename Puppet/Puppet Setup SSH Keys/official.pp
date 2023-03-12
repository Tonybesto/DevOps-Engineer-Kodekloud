#### Puppet Setup SSH Keys

node 'stapp01.stratos.xfusioncorp.com' {
    include ssh_node1
}
node 'stapp02.stratos.xfusioncorp.com' {
    include ssh_node2
}
node 'stapp03.stratos.xfusioncorp.com' {
    include ssh_node3
}

class ssh_node1 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'tony',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1B4pvUpjeE3nfgSBgSgWPF18P9nucZeV/nMkvK/cP1rnrlIE/jgySDjr2Z1h9d8xEKlmhq8BuLuSo3Ytslv416fjh0riK9mAARtKoN0ERUsKhezDeK7CIygPxYG/thu1XX2zITbfIBV+CYSjOfELk2cYd3r5kY9kQL5JkDPyPDwxT6xKlvz5JXEFpw8bwPN2DMeP0tEP2WodJGyVOGPq2VXL/UJDveSQKDWJc5ecPfryeJxPwce9iJJRr3/ScBgQKCcSxh4OAKUlGnoV2ligZ7F+DC/02VTRYt1o3jRPdSbZ+6FvVKZdfEqEFfA5tsOausG7jjr2O3yBBWVmWSerL',
    }
}

class ssh_node2 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'steve',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1B4pvUpjeE3nfgSBgSgWPF18P9nucZeV/nMkvK/cP1rnrlIE/jgySDjr2Z1h9d8xEKlmhq8BuLuSo3Ytslv416fjh0riK9mAARtKoN0ERUsKhezDeK7CIygPxYG/thu1XX2zITbfIBV+CYSjOfELk2cYd3r5kY9kQL5JkDPyPDwxT6xKlvz5JXEFpw8bwPN2DMeP0tEP2WodJGyVOGPq2VXL/UJDveSQKDWJc5ecPfryeJxPwce9iJJRr3/ScBgQKCcSxh4OAKUlGnoV2ligZ7F+DC/02VTRYt1o3jRPdSbZ+6FvVKZdfEqEFfA5tsOausG7jjr2O3yBBWVmWSerL',
    }
}

class ssh_node3 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'banner',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1B4pvUpjeE3nfgSBgSgWPF18P9nucZeV/nMkvK/cP1rnrlIE/jgySDjr2Z1h9d8xEKlmhq8BuLuSo3Ytslv416fjh0riK9mAARtKoN0ERUsKhezDeK7CIygPxYG/thu1XX2zITbfIBV+CYSjOfELk2cYd3r5kY9kQL5JkDPyPDwxT6xKlvz5JXEFpw8bwPN2DMeP0tEP2WodJGyVOGPq2VXL/UJDveSQKDWJc5ecPfryeJxPwce9iJJRr3/ScBgQKCcSxh4OAKUlGnoV2ligZ7F+DC/02VTRYt1o3jRPdSbZ+6FvVKZdfEqEFfA5tsOausG7jjr2O3yBBWVmWSerL',
    }
}
