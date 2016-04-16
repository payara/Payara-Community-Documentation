_Payara Server and Micro 161 (4.1.1.161) onwards_

Health Check Services offer 4 admin commands to enable/disable health checking, list all available services or do configuration per service basis.

## `healthcheck-configure`
__Usage:__ `./asadmin healthcheck-configure --enabled=true|false --dynamic=true|false`

__Aim:__ Enables/Disables the whole health check system. Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly.

## `healthcheck-list-services`
__Usage:__ `./asadmin healthcheck-list-services`

__Aim:__ Lists the service names of all configured health check services.

## `healthcheck-configure-service`
__Usage:__ `./asadmin healthcheck-configure-service --serviceName=<service.name> --enabled=true|false --dynamic=true|false --time=<integer.value> --unit=MICROSECONDS|MILLISECONDS|SECONDS|MINUTES|HOURS|DAYS`

__Aim:__ Enables/Disables or configures the execution timing of a given service specified with a name.  Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly. To have the newly added health check service configuration take effect, domain should be restarted. If this command gets executed before having the `<health-check-service-configuration>` tag defined in the domain.xml, it will also create the regarding tag. Keep in mind that if the `enabled` attribute of `<health-check-service-configuration>` is set to false, all services reside under the tag will be in passive mode.

## `healthcheck-configure-service-threshold`
__Usage:__ `./asadmin healthcheck-configure-service-threshold --serviceName=<service.name> --dynamic=true|false --thresholdCritical=90 --thresholdWarning=50 --thresholdGood=0`

__Aim:__ Configures critical, warning and good threshold values for a service specified with its name. Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly. In order to execute this command, there should be at least one service checker configuration defined within `<health-check-service-configuration>` tag. If none exits, `healthcheck-configure-service` command should be executed first.

## `get-healthcheck-configuration`
__Usage:__ `./asadmin get-healthcheck-configuration`

__Aim:__ Lists the saved configuration for health check services in a columnar format. A sample output is as follows:
```
Health Check Service Configuration is enabled?: true
Below are the list of configuration details of each checker listed by its name.

Name  Enabled  Time  Unit     
GC    false    10    SECONDS  

Name  Enabled  Time  Unit     thresholdPercentage  retryCount  
HT    true     10    SECONDS  95                   3           

Name  Enabled  Time  Unit     Critical Threshold  Warning Threshold  Good Threshold  
CPU   false    10    SECONDS  40                  20                 2               
HP    false    8     SECONDS  -                   -                  -               
MM    false    7     SECONDS  -                   -                  -             
```