# Healthcheck Service
#### Command Reference

The Health Check service offers 5 asadmin commands:

## `healthcheck-configure`
__Usage:__ `asadmin> healthcheck-configure --enabled=true|false --dynamic=true|false`

__Aim:__  Enables or disables the health check service. The command updates the `domain.xml` with the provided configuration but does not apply changes directly to the working service by default.

#### Command Options:

| Option | Type | Description | Default | Mandatory |
| --- | --- | --- | --- | --- |
| `--target` | String | The instance or cluster that will enable or disable its service | server | no |
| `--dynamic` | Boolean | Whether to apply the changes directly to the server without a reboot | false | no |
| `--enabled` | Boolean | Whether to enable or disable the service | N/A | yes |

#### Example: 
To enable the Healthcheck service such that it will only activate from the next time the server is restarted, the following command would be used:
```
asadmin> healthcheck-configure \
    --enabled=true \
    --dynamic=false
```

## `healthcheck-list-services`
__Usage:__ `asadmin> healthcheck-list-services`

__Aim:__ Lists the names of all metric services that can be configured for monitoring. 

#### Command Options
There are no options for this command.

#### Example

Running the command will show output similar to the example below:

> ```
> Available Health Check Services:
> 
> healthcheck-cpool
> healthcheck-cpu
> healthcheck-gc
> healthcheck-heap
> healthcheck-threads
> healthcheck-machinemem
> ```

## `healthcheck-configure-service`
__Usage:__ `asadmin> healthcheck-configure-service --serviceName=<service.name> --enabled=true|false --dynamic=true|false --time=<integer.value> --unit=MICROSECONDS|MILLISECONDS|SECONDS|MINUTES|HOURS|DAYS`

__Aim:__ Enables or disables the monitoring of an specific metric. If enabling the service for an specific metric, the command also configures the frequency of monitoring for that metric. Command updates the domain.xml with provided configurations but does not apply changes directly to the working service by default. _dynamic_ attribute should be set to _true_ in order to apply the changes directly.

#### Command Options

| Option | Type | Description | Default | Mandatory |
| --- | --- | --- | --- | --- |
| `--target` | String | The instance or cluster that will enable or disable its metric configuration | server | no |
| `--dynamic` | Boolean | Whether to apply the changes directly to the server without a reboot | false | no |
| `--enabled` | Boolean | Whether to enable or disable the metric monitoring | - | yes |
| `--serviceName` | String | The metric service name. Must correspond to one of the values listed before | - | yes |
| `--time` | Integer | The amount of time units that the service will use to periodically monitor the metric | 5 | no |
| `--unit` | TimeUnit | The time unit to set the frequency of the metric monitoring. Must correspond to a valid [`java.util.concurrent.TimeUnit`](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/TimeUnit.html) | `MINUTES` | no |

If this command gets executed before running the [`healthcheck-configure`](#healthcheck-configure) command, the command will succeed and the configuration will be saved, but the healthcheck service will not be enabled.

### Example
A very basic command to simply enable the GC checker and activate it without needing a restart would be as follows:

```
asadmin> healthcheck-configure-service --enabled=true --serviceName=healthcheck-gc --dynamic=true
```


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

