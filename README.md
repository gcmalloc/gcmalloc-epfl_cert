#EPFL certificate Puppet Module
# Class epfl_cert
## Overview

This module generate a x509 certificate key and csr that is compatible with epfl. You would
then need to provide the certification authority of epfl with the resulting certificate request.

This request will be in `/etc/ssl/certs/${name}.csr`. The current proxy authority for the certificate
is http://rauth.epfl.ch/.

## Module Description

This module uses the openssl from camptocamp to generate an open ssl certificate. It 
will try to guess the 

## Example

To generate a simple certificate:

```puppet
epfl_cert{'gitlab':
}
```


## Parameters

# server_name

This is the name of the certificate.

# unit

An optional unit name that must match `^[A-Z-] $`

#email

An optional email 

#altname

A list of optional alternative server name for the created certficate.

# commonname

The common name used in the certificate. This will default to the fqdn of the host.

# state_enabled

If the state should be embedded in the certificate. It will be set to VD.
This is an optional feature that will be by default set to false

## Limitations

This module supports all the os supported by the openssl module.
