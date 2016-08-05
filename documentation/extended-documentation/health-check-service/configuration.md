# Domain Configuration

_Payara Server and Micro 161 \(4.1.1.161\) onwards_

The Health Check Services can be configured through the domain.xml as given follows:

```xml
<health-check-service-configuration enabled="true">
    <cpu-usage-checker unit="SECONDS" name="CPU" time="5" enabled="true"></cpu-usage-checker>
    <garbage-collector-checker unit="SECONDS" name="GC" time="5" enabled="true"></garbage-collector-checker>
    <machine-memory-usage-checker enabled="true" unit="SECONDS" name="MMEM" time="5">
        <property name="threshold-critical" value="90"></property>
        <property name="threshold-warning" value="70"></property>
        <property name="threshold-good" value="0"></property>
    </machine-memory-usage-checker>
    <heap-memory-usage-checker unit="SECONDS" name="HEAP" time="5" enabled="true"></heap-memory-usage-checker>
</health-check-service-configuration>
```

The main configuration tag is the `<health-check-service-configuration>` and it can be placed under `<config name="server-config">` tag. It has only one attribute named `enabled`, which can be set to either `true|false` and this enables or disables the entire Healthcheck service.

## The List of Available Checkers

`<health-check-service-configuration>` can contain a variety of checker tags from the list given as follows. All of these checker configurations do specific monitoring on each of the listed metrics:

* `<cpu-usage-checker>`: Calculates the CPU usage and prints out the percentage along with the usage time;
* `<garbage-collector-checker>`: Calculates and prints out how many times GC is executed with its elapsed time.
* `<machine-memory-usage-checker>`: Calculates the machine memory usage and prints out the percentage along with the total and used physical memory size.
* `<heap-memory-usage-checker>`: Calculates the heap memory usage and prints out the percentage along with initial and committed heap sizes.
* `<hogging-threads-checker>`: Identifies the threads that are stuck CPU-wise.
* `<connection-pool-checker>`: Calculates the ratio of free\/used connections available for all JDBC connections pool an prints the percentage of used connections for each active pool.


They all have the following base attributes, that need to be specified:

* **enabled**:Enables\/Disables the specified checker.
* **name**: Name of the checker that will be printed in the log messages for tracing.
* **unit**: The time unit value, which could either be: `NANOSECONDS`, `MICROSECONDS`, `MILLISECONDS`, `SECONDS`, `HOURS`, `DAYS`. 
* **time**: The time interval value \(as an integer\) specified in given unit to execute the checker for the metric.

## Threshold configurations

Just like with the  `healthcheck-configure-service-threshold`  command, there are threshold configurations for the following checkers and checker tags:

* `<cpu-usage-checker>`
* `<machine-memory-usage-checker>`
* `<heap-memory-usage-checker>`
* `<connection-pool-checker>` 


The threshold configurations are specified for 3 different levels: _critical_, _warning_ and _good_. By default their values are **80**, **50** and **0** respectively. A sample configuration for the `cpu-usage-checker` is given as follows:

```xml
<cpu-usage-checker enabled="true" unit="SECONDS" name="CPU" time="3">
    <property name="threshold-critical" value="90"></property>
    <property name="threshold-warning" value="70"></property>
    <property name="threshold-good" value="0"></property>
</cpu-usage-checker>
```

Keep in mind that all threshold values must be provided, otherwise the configuration will not work appropriately and will cause a startup error.

## Checkers with Customized Configuration

#### `<hogging-threads-checker>`

The Hogging Threads Checker offers the following 2 properties for configuration:

* `threshold-percentage`: Defines the minimum percentage needed to count the thread is hogged CPU-wise. The percentage is calculated with the ratio of elapsed CPU time to checker execution interval. It default value is _95_.
* `retry-count`: Represents the count value that should be reached by the hogged thread in order to give health check messages to the user. Its default value is 3.

A sample of this configuration could be:
```
<health-check-service-configuration enabled="true">
      <hogging-threads-checker unit="MINUTES" time="1" enabled="true" threshold-percentage="65" retry-count="10"></hogging-threads-checker>
 </health-check-service-configuration>

```

