class winrm {
    
    # windows remote management service
    service { 'WinRM':
     ensure => 'running',
     enable => true,
    }
    
    class { 'windows_firewall::exception':
      direction => 'in',
      action => 'Allow',
      enabled => 'yes',
      protocol => 'TCP',
      port => '5985',
      key_name => 'WINRM-HTTP-In-TCP',
      display_name => 'Windows Remote Management HTTP-In',
      description => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
    }
    
    # TODO: winrm create winrm/config/Listener?Address=*+Transport=HTTP
    
}