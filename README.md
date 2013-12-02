## Puppet module for Salt

This Puppet module installs and configures Salt.  
Tested on Ubuntu and CentOS.

## Class ::salt

Installs Salt.
  
Provides access to primary configuration options.  
If you need access to more options, you probably won't be using Puppet at that point.  
All minion specific parameters start with `minion_` prefix.  
All master specific parameters start with `master_` prefix.  

Controls Salt service.

At minimum you may want to change a value for minion parameter `master`:
`minion_master => 'salt-master.example.com'`

Alternatively you can set internal DNS to resolve the name 'salt' to the Salt Master IP.

`facter_include` parameter allows you to make facts into grains.  
It runs facter and saves output in `/etc/salt/grains` file in a following format:  
   
    facter:
      fact1:
       - value1
      fact2: 
       - value2
... and so on

To target, just use `-G 'facter:name:value'`  
NOTE: if you already have `/etc/salt/grains` file non empty, do not use this option, as it will override its content.  
Disabled by default.

For more details on parameters, check class `salt`.

## Usage, class ::salt

install Salt (minion only)  

    include salt

install Salt (minion only) and set minion option `master` to 'salt-master.example.com'

    class {'::salt':
      minion_master => 'salt-master.example.com',
    }

same as above plus make facts into grains

    class {'::salt':
      minion_master => 'salt-master.example.com',
      facter_include => true,
    }

install Salt (master and minion) and set minion option `master` to 'salt-master.example.com'

    class {'::salt':
      master        => true,
      minion_master => 'salt-master.example.com',
    }

## Tests
For more examples check module tests directory.  
NOTE: make sure you don't run tests on Production server.
