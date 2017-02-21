# SNMP Notifier

The **S**imple **N**etwork **M**anagement **P**rotocol is a standard Internet Protocol that was designed to collect and organize information about all managed devices and services that belong to the same network. **SNMP **is supported by a huge variety of devices, including network devices like routers, modems and switches, servers and in the latter years extended to cover IoT devices and specialized equipment connected to the cloud.

## Basic Concepts



Payara Server notifies network management systems using SNMP traps. A SNMP trap is a special PDU \(Protocol Data Unit\) that is used to generate an asynchronous notification from an _agent _to a _manager._ Each SNMP trap usually contains standard fields that are used by the network management system. Payara Server uses the following fields in its traps:

* **sysUpTime**: Provides the amount of time that has elapsed between the last network reinitialization and generation of the trap.

* 
In order for a network management system to understand a trap sent to it by an agent, the management system must know what the object identifier \(OID\) defines. Therefore, it must have the MIB for that trap loaded. This provides the correct OID information so that the network management system can understand the traps sent to it.

An important point to stress with SNMP traps is that they are asynchronous events that can occur at any time, which means that your network managing software expects to receive updates in a PASSIVE manner.





