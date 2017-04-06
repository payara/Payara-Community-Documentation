_Payara Server and Micro 162 (4.1.1.162) onwards_

The Phone Home Services offer three admin commands to enable/disable activity and to list the current setting.

## `enable-phone-home`
__Usage:__ `./asadmin enable-phone-home`

__Aim:__ Enables the Phone Home service. Command updates the domain.xml. 

## `disable-phone-home`
__Usage:__ `./asadmin disable-phone-home`

__Aim:__ Disables the Phone Home service. Command updates the domain.xml and disables the running service

## `list-phone-home`
__Usage:__ `./asadmin list-phone-home`

__Aim:__ Lists the current status of the Phone Home service as Enabled or Disabled  
