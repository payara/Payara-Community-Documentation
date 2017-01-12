# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Enabling Hazelcast](#3-enabling-hazelcast)
  * [3.1 Enabling Hazelcast through the Admin Console](#31-enabling-hazelcast-through-the-admin-console)
  * [3.2 Enabling Hazelcast using Asadmin](#32-enabling-hazelcast-using-asadmin)
  * [3.3 Enabling Hazelcast in the domain.xml file](#33-enabling-hazelcast-in-the-domainxml-file)
* [4. Configuring Hazelcast](#4-configuring-hazelcast)
  * [4.1 Configuring Hazelcast with the Admin Console](#41-configuring-hazelcast-with-the-admin-console)
  * [4.2 Configuring Hazelcast using Asadmin](#42-configuring-hazelcast-using-asadmin)
  * [4.3 Configuring Hazelcast in the domain.xml file](#43-configuring-hazelcast-in-the-domainxml-file)
* [5. Using Hazelcast in your applications](#5-using-hazelcast-in-your-applications)
  * [5.1 Accessing the JNDI registered Hazelcast Instance](#51-accessing-the-jndi-registered-hazelcast-instance)
* [6. Using Hazelcast for Web and EJB container Persistence](#6-using-hazelcast-for-the-web-and-ejb-container-persistence)
  * [6.1 Setting Hazelcast as the Persistence Provider through the Admin Console](#61-setting-hazelcast-as-the-persistence-provider-through-the-admin-console)
    * [6.1.1 For the Web Container](#611-for-the-web-container)
    * [6.1.2 For the EJB Container](#612-for-the-ejb-container)
  * [6.2 Setting Hazelcast as the Persistence Provider using Asadmin](#62-setting-hazelcast-as-the-persistence-provider-using-asadmin)
    * [6.2.1 For the Web Container](#621-for-the-web-container)
    * [6.2.2 For the EJB Container](#622-for-the-ejb-container)
  * [6.3 Setting Hazelcast as the Persistence Provider in the domain.xml file](#63-setting-hazelcast-as-the-persistence-provider-in-the-domainxml-file)
    * [6.3.1 For the Web Container](#631-for-the-web-container)
    * [6.3.2 For the EJB Container](#632-for-the-ejb-container)
* [7. Asadmin Commands](#7-asadmin-commands)
  * [7.1 set-hazelcast-configuration](#71-set-hazelcast-configuration)
  * [7.2 get-hazelcast-configuration](#72-get-hazelcast-configuration)
  * [7.3 list-hazelcast-members](#73-list-hazelcast-members)
  * [7.4 restart-hazelcast](#74-restart-hazelcast)
  * [7.5 list-hazelcast-cluster-members](#75-list-hazelcast-cluster-members)

# 1. Overview
This page covers how to use the Hazelcast functionality in Payara 4.1.1.162.  
Hazelcast is an In-Memory Data Grid, providing Web and EJB session persistence, and implementing JSR107 (JCache) in Payara Server.

# 2. Documentation Conventions
_${Product-Root}_ - This is the root of the Payara server directory, referring to where you have Payara installed.  
_${Domain}_ - This refers to the name of your Payara domain.  
_${Target}_ - This refers to the name of an instance or cluster.  
`...` - Denotes a skipping of unrelated code that would be present in the actual file or program.  
_${Cluster-Config}_ - This refers to the name of a cluster configuration.

# 3. Enabling Hazelcast
In the default domain configuration of Payara, Hazelcast is not enabled. It can be enabled either through the Admin Console, using a command line _asadmin_ command, or through editing the _domain.xml_ file.

## 3.1 Enabling Hazelcast through the Admin Console
From the Admin Console home:
* Click on the Domain, specific cluster, or standalone instance
* Click on the _Hazelcast_ tab to see the _Hazelcast Configuration_ page.
* Check the _Enabled_ box, and save your changes

## 3.2 Enabling Hazelcast using Asadmin
The _set-hazelcast-configuration_ asadmin command requires you to specify whether or not Hazelcast is enabled each time you run it. This command is also used to configure Hazelcast, which will be covered [here](#42-configuring-hazelcast-using-asadmin).
The command requires the Admin Server to be running, and will expect it to be listening on port 4848 unless specified differently with the _--port_ asadmin utility option.

`asadmin set-hazelcast-configuration --enabled=true`

If no target is specified, the command will enable Hazelcast on the domain configuration _(server-config)_. To enable Hazelcast on another instance or cluster, use the _--target_ option like so:

`asadmin set-hazelcast-configuration --enabled=true --target=${Target}`

The _dynamic_ option of the asadmin command defaults to false, so to enable Hazelcast without requiring a restart of the target instance/cluster, use _--dynamic=true_:

`asadmin set-hazelcast-configuration --enabled=true --dynamic=true` 

## 3.3 Enabling Hazelcast in the domain.xml file
* Open up the _domain.xml_ file in your text editor of choice, it can be found under _${Product\_Root}/glassfish/domains/${Domain}/config/_  
* Find the _\<hazelcast-runtime-configuration\>_ tag under the appropriate _\<config\>_ tag (e.g. _\<config name="server-config"\>_ for the domain and the Admin Server), and add _enabled="true"_ to it, like so:  
`<hazelcast-runtime-configuration enabled="true"/>`
  * Note - If you're editing the _domain.xml_ of a domain that has not been started at least once, this tag will not exist and you will have to add it in yourself

# 4. Configuring Hazelcast
Payara Server supports configuring Hazelcast through the Admin Console or _domain.xml_ file, or by using a Hazelcast configuration file. Using a Hazelcast configuration file will cause the settings in the Admin Console and _domain.xml_ file to be ignored, with any parameters not specified in the configuration file reverting to the Hazelcast defaults, even if they are specified in the Admin Console or _domain.xml_ (Note - the Hazelcast defaults are not necessarily the same as the Payara Hazelcast defaults).

## 4.1 Configuring Hazelcast with the Admin Console
Navigate to the Hazelcast configuration page as detailed in [Enabling Hazelcast through the Admin Console](#31-enabling-hazelcast-through-the-admin-console):  
* Click on the Domain, specific cluster, or standalone instance
* Click on the _Hazelcast_ tab to see the _Hazelcast Configuration_ page.  

From here, the following configuration options are available to you (excluding the _Enabled_ property detailed above):  

| Property                    | Description                                                                                                                          |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Dynamic                     | Determines if the Hazelcast member embedded in Payara will be restarted to apply any changes made                               |
| Override Configuration File | Specifies the Hazelcast configuration file to use. The path specified is relative to the domain config directory. If you are using a custom GlassFish server configuration for a cluster or standalone instance e.g. cluster-config then the hazelcast configuration file should be placed in the directory with the same name e.g. $domain_root/config/cluster-config. This will ensure it is replicated to the node during startup.                |
| Start Port                  | Determines the port to start Hazelcast on. If this port is in use, Hazelcast will increment this port until it finds one it can use. |
| Multicast Port              | The multicast port for communications in the Hazelcast cluster.                                                                     |
| Multicast Group             | The multicast group for communications in the Hazelcast cluster.                                                                     |
| JNDI Name                   | The JNDI name to bind the Hazelcast instance to.                                                                                     |

Enter your required values, and click _Save_. Restarting the domain or instance/cluster is not necessary for any changes made to take effect.

## 4.2 Configuring Hazelcast using Asadmin
As noted in the [Enabling Hazelcast using Asadmin](#32-enabling-hazelcast-using-asadmin) section, the _set-hazelcast_configuration_ asadmin command is used to both enable/disable Hazelcast, and to configure it. You can pass the _--help_ option to the command to see usage instructions in your terminal. The available configuration options can be found [here](#71-set-hazelcast-configuration).

The following example demonstrates setting all of the options on a cluster called _cluster1_:
  
`asadmin set-hazelcast-configuration --enabled=true --target=cluster1 --dynamic=true -f hazelcast-config.xml --startport=5902 -g 224.2.2.3 --multicastport=6666 -j payara/Hazelcast`  

## 4.3 Configuring Hazelcast in the _domain.xml_ file
* Open up the _domain.xml_ file in your text editor of choice, it can be found under _${Product\_Root}/glassfish/domains/${Domain}/config/_  
* Find the _\<hazelcast-runtime-configuration\>_ tag under the appropriate _\<config\>_ tag (e.g. _\<config name="server-config"\>_ for the Admin Server), and add one or more of the following properties to it as required:

| Property                     | Admin Console Equivalent    | Description                                                                                                                          |
|------------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| hazelcast-configuration-file | Override Configuration File | Specifies the Hazelcast configuration file to use. The path specified must be relative to the domain config directory.               |
| start-port                   | Start Port                  | Determines the port to start Hazelcast on. If this port it in use, Hazelcast will increment this port until it finds one it can use. |
| multicast-group              | Multicast Group             | The multicast group for communications in the Hazelcast cluster.                                                                     |
| multicast-port               | Multicast Port              | The multicast port for group communications in the Hazelcast cluster.                                                                |
| jndi-name                    | JNDI Name                   | The JNDI name to bind the Hazelcast instance to.                                                                                     |

See here for an example configuration demonstrating each property:

```XML
<config name="server-config">
    ...  
    <hazelcast-runtime-configuration enabled="true" hazelcast-configuration-file="hazelcast-configuration.xml" start-port="5666" multicast-group"224.2.2.4" jndi-name="payara/Hazelcast1 multicast-port="54328"></hazelcast-runtime-configuration>
    ...  
</config>
```

# 5. Using Hazelcast in your Applications
The following sections will detail how to use the Hazelcast embedded in Payara within your code.  

## 5.1 Accessing the JNDI registered Hazelcast instance
By default, the JNDI name of the hazelcast instance is _payara/Hazelcast_, though this can be altered as detailed in [section 4](#4-configuring-hazelcast).  

You will need to import the following packages into your Java class:  

```Java
import com.hazelcast.core.HazelcastInstance;
import javax.naming.Context;
import javax.naming.InitialContext;
```

To import the Hazelcast package, you will need to set the Payara Hazelcast package as a dependency in the project _pom.xml_ file (for Maven projects), or for you to set the Hazelcast JAR as a project dependency (if using a non-Maven based project). To add the Payara Hazelcast package as a dependency in a pom, enter the following in the dependencies section of your pom:  

```Maven_POM
<dependency>
    <groupId>fish.payara.appserver</groupId>
    <artifactId>payara-jsr107</artifactId>
    <version>4.1</version>
    <type>jar</type>
    <scope>provided</scope>
</dependency>
```

The Hazelcast JAR (for non-Maven projects), can either be downloaded from the [Hazelcast website](http://hazelcast.org/download/), or you can make use of the JAR packaged with Payara. The JAR packaged with Payara can be found at _${Product-Root}/glassfish/modules/hazelcast.jar_.  

The following will initialise a _HazelcastInstance_ variable with the instance embedded in Payara:

```Java
Context ctx = new InitialContext();  
HazelcastInstance instance = (HazelcastInstace) ctx.lookup("payara/Hazelcast");  
```

You will have to wrap this in a try-catch clause, or throw the _Naming Exception_ that this could generate.  

# 6. Using Hazelcast for the Web and EJB Container Persistence
You can use Hazelcast as the persistence provider for the Web and EJB Container in a cluster. Hazelcast must be enabled for this to work, which is detailed in [section 3](#3-enabling-hazelcast) (Note, even if Hazelcast is not enabled, you will still be able to select Hazelcast as the persistence provider; the persistence will fail in these circumstances).  

## 6.1 Setting Hazelcast as the Persistence provider through the Admin Console
In the left hand panel, under Configurations, expand the configuration of the cluster you wish to set Hazelcast as the persistence provider for, and click on _Availability Service_.  

### 6.1.1 For the Web Container
To set Hazelcast as the persistence provider of the Web Container:  
* Navigate to the _Web Container Availability_ tab
* Expand the _Persistence Type_ drop-down menu, and select _hazelcast_
* Save your changes

### 6.1.2 For the EJB Container
To set Hazelcast as the persistence provider of the EJB Container:  
* Navigate to the _EJB Container Availability_ tab
* Expand the _HA Persistence Type_ drop-down menu, and select _hazelcast_
* Save your changes

## 6.2 Setting Hazelcast as the Persistence provider using Asadmin
To configure the persistence provider with _asadmin_, you have to use the _set_ command.

### 6.2.1 For the Web Container
To set Hazelcast as the persistence provider of the Web Container, run:
`asadmin set ${Cluster-Config}.availability-service.web-container-availability.persistence-type=hazelcast`

### 6.2.2 For the EJB Container
To set Hazelcast as the persistence provider of the EJB Container, run:
`asadmin set ${Cluster-Config}.availability-service.ejb-container-availability.sfsb-ha-persistence-type=hazelcast`

## 6.3 Setting Hazelcast as the Persistence provider in the domain.xml file
Configuring the persistence provider via the _domain.xml_ file requires editing the _availability-service_ settings of a cluster configuration.

### 6.3.1 For the Web Container
To set Hazelcast as the persistence provider of the web container, edit _domain.xml_ as follows:  

```XML
<config name="${Cluster-Config}">
    ...
    <availability-service>
        ...
        <web-container-availability persistence-type="hazelcast"></web-container-availability>
        ...
    </availability-service>
    ...
</config>
```

### 6.3.2 For the EJB Container
To set Hazelcast as the persistence provider of the web container, edit _domain.xml_ as follows:  

```XML
<config name="${Cluster-Config}">
    ...
    <availability-service>
        ...
        <ejb-container-availability sfsb-ha-persistence-type="hazelcast"></ejb-container-availability>
        ...
    </availability-service>
    ...
</config>
```

# 7. Asadmin Commands

## 7.1 set-hazelcast-configuration
Enables/Disables and configures the embedded Hazelcast member. This command requires the Admin Server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|-----------|
| --enabled |  | Determines whether or not the embedded Hazelcast member is enabled or disabled. | false | Yes |
| --target |  | The instance or cluster to configure. | server | No |
| --dynamic |  | Enable or disable dynamic stopping and starting of the embedded Hazelcast member. | false | No |
| --hazelcastconfigurationfile | -f | The Hazelcast configuration file to use. The path is relative to domain config directory (_${Product\-Root}/glassfish/domains/${Domain}/config/_). Using this option to point to a valid Hazelcast configuration file will cause all other options set to be ignored. Any options not specified in the Hazelcast configuration file will revert to the Hazelcast defaults. | hazelcast-config.xml | No |
| --startport |  | The port to run Hazelcast on. If this port is busy, the port specified will be incremented until a valid port is found. | 5900 | No |
| --multicastgroup | -g | The multicast group for communications in the Hazelcast instance. | 224.2.2.3 | No |
| --multicastport |  | The multicast port for communications in the Hazelcast instance. | 54327 | No |
| --jndiname | -j | The JNDI name to bind the Hazelcast instance to. | payara/Hazelcast | No |

Example:  
`asadmin set-hazelcast-configuration --enabled=true --target=cluster1 --dynamic=true -f hazelcast-config.xml --startport=5902 -g 224.2.2.3 --multicastport=6666 -j payara/Hazelcast`

## 7.2 get-hazelcast-configuration
Gets the configuration settings of the embedded Hazelcast member. This command requires the Admin Server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|----------|----------|----------------------------------------------------------------|---------|-----------|
| --target |  | The instance or cluster to get the Hazelcast configuration of. | server | No |

Example:  
`asadmin get-hazelcast-configuration --target=server`

## 7.3 list-hazelcast-members
Lists the active Hazelcast instances and their clustering. This command requires the Admin Server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|----------|----------|----------------------------------------------------------------|---------|-----------|
| --target |  | The instance or cluster to get the Hazelcast configuration of. | server | No |

Example:  
`asadmin list-hazelcast-members --target=server`

## 7.4 restart-hazelcast
Restarts the Hazelcast instances attached to a server or cluster. This command requires the Admin Server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|----------|----------|----------------------------------------------------------------|---------|-----------|
| --target |  | The instance or cluster to get the Hazelcast configuration of. | server | No |

Example:  
`asadmin restart-hazelcast --target=server`

## 7.5 list-hazelcast-cluster-members

Lists information about the instances in the domain's Hazelcast cluster, including Payara Micro instances.

Usage: `list-hazelcast-cluster-members [--type=type]`

| Option | Shortcut | Description | Default | Mandatory |
|----------|----------|----------------------------------------------------------------|---------|-----------|
| --type |  | Accepts a String of `micro` or `server`, and filters the result to only list information about Payara Micro or Payara Server instances respectively | | No |

Example to list all instances in the cluster:

```
asadmin list-hazelcast-cluster-members
```

Example to list only Payara Micro instances in the cluster:

```
asadmin list-hazelcast-cluster-members --type=micro
```



