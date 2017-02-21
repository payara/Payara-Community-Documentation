# SNMP Notifier

The **S**imple **N**etwork **M**anagement **P**rotocol is a standard Internet Protocol that was designed to collect and organize information about all managed devices and services that belong to the same network. **SNMP **is supported by a huge variety of devices, including network devices like routers, modems and switches, servers and in the latter years extended to cover IoT devices and specialized equipment connected to the cloud.

## Basic Concepts

Payara Server notifies network management systems using SNMP traps. A SNMP trap is a special PDU \(Protocol Data Unit\) that is used to generate an asynchronous notification from an _agent \_to a \_manager._ Each SNMP trap usually contains standard fields that are used by the network management system. Payara Server uses the following fields in its traps:

* **sysUpTime**: Provides the amount of time that has elapsed between the last network reinitialization and generation of the trap.

* Message --

In order for a network management system to understand a trap sent to it by an agent, the management system must know what the object identifier \(OID\) defines. Therefore, it must have the MIB for that trap loaded. This provides the correct OID information so that the network management system can understand the traps sent to it.

An important point to stress with SNMP traps is that they are asynchronous events that can occur at any time, which means that your network managing software expects to receive updates in a PASSIVE manner.

### Using the Administration Web Console

To configure the Notification Service in the Administration Console, go to _Configuration -&gt; \[instance-configuration \(like server-config\)\] -&gt; Notification Service_ and click on the **SNMP** tab:

...

### From the Command Line

To configure the Notification Service from the command line, use the `notification-snmp-configure` asadmin command, specifying the tokens like this:

```
asadmin > notification-snmp-configure --enabled=true --dynamic=true --hostname=localhost --port=162 --community=public --oid=".1.3.6.1.2.1.1.8" --version=v2c
```

You can use the `--enabled` and `--dynamic` options to enable/disable the SNMP notifier on demand.

Also, you can retrieve the current configuration for the SNMP notifier using the `get-slack-notifier-configuration` asadmin command like this:

```Shell
asadmin > get-snmp-notifier-configuration
```

This will return the details of the current SNMP configuration; see below for an example:

```Shell
Enabled    Community    OID                  Version   Host        Port
true       example      .1.3.6.1.2.1.1.8     v2c       127.0.0.1   162
```

### On the _domain.xml_ configuration file

To configure the Notification Service in the _domain.xml_ configuration file, locate the `notification-service-configuration` element in the tree and insert slack-notifier-configuration with the respective attributes like this:

```
<notification-service-configuration enabled="true">
    <snmp-notifier-configuration host="localhost" oid=".1.3.6.1.2.1.1.8" community="public" version="v2c" enabled="true" port="162"></snmp-notifier-configuration>
</notification-service-configuration>
```


