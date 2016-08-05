# Overview of the asadmin commands

_Payara Server and Micro 161 \(4.1.1.161\) onwards_

The Health Check service offers the following 5 _asadmin_ commands:

## `healthcheck-configure`

Enables or disables the health check service. The command updates the _domain.xml_ with the provided configuration but does not apply changes directly to the working service by default.

| Option | Type | Description | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| --target | String | The instance or cluster that will enable or disable its service | _server _ | no |
| --dynamic | Boolean | Whether to apply the changes directly to the server without a reboot | _false_ | no |
| --enabled | Boolean | Whether to enable or disable the service | N\/A | yes |

## `healthcheck-list-services`

Lists the names of all metric services that can be configured for monitoring. Currently the listed values are:

```
Available Health Check Services:

 healthcheck-cpool
 healthcheck-cpu
 healthcheck-gc
 healthcheck-heap
 healthcheck-threads
 healthcheck-machinemem
```

## `healthcheck-configure-service`

Enables or disables the monitoring of an specific metric. If enabling the service for an specific metric, the command also configures the frequency of monitoring for that metric. Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly.

| Option | Type | Description | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| --target | String | The instance or cluster that will enable or disable its metric configuration | _server _ | no |
| --dynamic | Boolean | Whether to apply the changes directly to the server without a reboot | _false_ | no |
| --enabled | Boolean | Whether to enable or disable the metric monitoring | N\/A | yes |
| --serviceName | String | The metric service name. Must correspond to one of the values listed before | N\/A | yes |
| --time | Integer | The amount of time units that the service will use to periodically monitor the metric | N\/A | yes |
| --unit | Enum | The time unit to set the frequency of the metric monitoring. Must correspond to one of \[MICROSECONDS \| MILLISECONDS \| SECONDS \| MINUTES \| HOURS \| DAYS\] | N\/A | yes |

If this command gets executed before having the `<health-check-service-configuration>` tag defined in the _domain.xml_, it will also create the regarding tag. Keep in mind that if the `enabled` attribute of `<health-check-service-configuration>` is set to false, all services reside under the tag will be in passive mode.

## `healthcheck-configure-service-threshold`

Configures **CRITICAL**, **WARNING **and **GOOD **threshold values for a service specified with its name. Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly. This command only configures thresholds for the following metrics:

* CPU Usage
* JVM Heap Space
* Host Memory
* JDBC Connection Pools

| Option | Type | Description | Default Value | Mandatory |
| --- | --- | --- | --- | --- |
| --target | String | The instance or cluster that will be configured | _server _ | no |
| --dynamic | Boolean | Whether to apply the changes directly to the server without a reboot | _false_ | no |
| --serviceName | String | The metric service name. Must correspond to one of the values listed before | N\/A | yes |
| --thresholdCritical | Integer | The threshold value that this metric must surpass to log a **CRITICAL** event. A value between _WARNING VALUE_ and _100_ must be used | 90 | no |
| --thresholdWarning | Integer | The threshold value that this metric must surpass to log a **WARNING** event. A value between _GOOD VALUE_ and _CRITICAL VALUE_ must be used | 50 | no |
| --thresholdGood | Integer | The threshold value that this metric must surpass to log a **GOOD** event. A value between _0_ and _WARNING VALUE_ must be used | 0 | no |

In order to execute this command for an specific metric, the `healthcheck-configure-service` command needs to be executed first.

### Important!

There is no _asadmin_ command to configure the threshold values for the **Hogging Threads** or **Garbage Collection** metrics. In the case of the Hogging Threads metrics, check the domain.xml configuration section on how to adjust its parameters.

In the case of the Garbage Collection metric, there is no configuration available for this metric; since the service calculates and prints out how many times garbage collections were executed within the time elapsed since the last check. The service will determine the severity of the messages based on how much the CPU time is being taken by the GC when measuring.

## `get-healthcheck-configuration`

Lists the current configuration for the health check service and for the configured metrics in a tabular format. A sample output is as follows:

```
Health Check Service Configuration is enabled?: true

Below are the list of configuration details of each checker listed by its name.

Name    Enabled    Time    Unit
GC      false      10      SECONDS

Name    Enabled    Time    Unit     Threshold Percentage    Retry Count
HT      true       10      SECONDS  95                      3

Name    Enabled    Time    Unit     Critical Threshold      Warning Threshold      Good Threshold
CONP    true       5       MINUTES  70                      40                     20
CPU     false      10      SECONDS  40                      20                     2
HP      false      8       SECONDS  -                       -                      -
MM      false      7       SECONDS  -                       -                      -
```

