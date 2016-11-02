# Alternate Store for EJB Timers

## Contents

## 1. Overview

Starting with release _4.1.1.164_, the distributed Hazelcast cache can be used to store the persistent EJB timers of deployed Java EE applications on the server. 

## 2. Documentation Conventions

 _${Product-Root}_ - This is the root of the Payara server directory, referring to where you have Payara installed.  _${Domain}_ - This refers to the name of your Payara domain.  `...` - Denotes a skipping of unrelated code that would be present in the actual file or program. 

## 3. EJB Timers Storage Configuration

Traditionally, persistent EJB timers are set to be stored inside a relational database of configured under the EJB Container component of the server's configuration (on _${Domain}/config/domain.xml_):

````xml
<ejb-container>
    <ejb-timer-service timer-datasource="jdbc/MyTimerDB"></ejb-timer-service>
</ejb-container>
```

By default, the server will use the pre-configured `jdbc/__TimerPool` datasource to store persistent timers into an embedded Derby database saved into the _${Domain}/applications/databases_ directory.



