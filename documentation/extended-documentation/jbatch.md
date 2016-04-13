# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Defining a Schema name](#3-defining-a-schema-name)
  * [3.1 Defining a Schema name through the Admin Console](#31-defining-a-schema-name-through-the-admin-console)
  * [3.2 Defining a Schema name using Asadmin](#32-defining-a-schema-name-using-asadmin)
  * [3.3 Defining a Schema name in the domain.xml file](#33-defining-a-schema-name-in-the-domainxml-file)
* [4. Altered Asadmin Commands](#4-altered-asadmin-commands)
  * [4.1 set-batch-runtime-configuration](#41-set-batch-runtime-configuration)

# 1. Overview
This page shall cover how to use the new JBatch functionality introduced in Payara 4.1.144.  

# 2. Documentation Conventions
_${Product-Root}_ - This is the root of the Payara server directory, referring to where you have Payara installed.  
_${Domain}_ - This refers to the name of your Payara domain.  

# 3. Defining a Schema name
Included in this release of Payara is the ability to define the name of the database schema that will hold the batch tables. This can be set via the Admin Console, in the _domain.xml_ file, or using Asadmin commands.  

## 3.1 Defining a Schema name through the Admin Console
* Click on the instance or cluster to move to its configuration page.
* Select the _Batch_ tab, and from there click on the _Configuration_ sub-tab.
* Enter your desired value in the _Database Schema Name_ field.
* Save your changes

## 3.2 Defining a Schema name using Asadmin
This is set using the `set-batch-runtime-configuration` command.  
The command requires you to specify the Executor or Datasource lookup name, which you can do with the _-x_ or _-d_ options respectively.  
The command defaults to targeting the Admin Server instance (_server_), to target a different instance or cluster, use the _--target_ option.  
TO specify the schema name, use the _--schemaName_ option, or its shortcut _-n_.  
An example can be seen below:  

`asadmin set-batch-runtime-configuration -d jdbc/__default --target cluster1 -n test`  

This command expects the Admin Server to be listening on port 4848. If it is not, use the _-p_ option to specify the port, for example:  
`asadmin -p 5048 set-batch-runtime-configuration -d jdbc/__default --target cluster1 -n test`  

## 3.3 Defining a Schema name in the domain.xml file
* Open up the _domain.xml_ file of the domain in question to edit.
  * It can be found under _${Product\_Root}/glassfish/domains/${Domain}/config/_  
* Find the _\<batch-runtime-configuration\>_ tag under the appropriate _\<config\>_ tag (e.g. _\<config name="server-config"\>_ for the Admin Server), and enter the schema name like so:  
`<batch-runtime-configuration schema-name="testSchemaName"></batch-runtime-configuration>`
  * Note - If you're editing the _domain.xml_ of a domain that has not been started at least once, the _batch-runtime-configuration_ tag will not exist and you will have to add it in yourself

# 4. Altered Asadmin Commands

## 4.1 set-batch-runtime-configuration
Sets the batch runtime configuration settings. This command requires the admin server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|-----------------------------|----------|-------------------------------------------------------------------|---------|---------------------------------------------|
| --target |  | The instance or cluster to set the JBatch configuration of. | server | No |
| --datasourcelookupname | -d | Sets the name of the datasource to lookup and use. |  | Yes, or specify _executorServiceLookupName_ |
| --executorservicelookupname | -x | Sets the name of the executor service to lookup and use. |  | Yes, or specify _datasourceLookupName_ |
| --schemaName | -n | Sets the name of the database schema that holds the batch tables. | APP  | No |

## 4.2 Restrictions
JBatch will not create internally more than one set of Jbatch tables per schema. So in your schema if there exists a set of JBatch tables with prefixes and suffixes in the table names and then specify in the Glassfish JBatch configuration for the same schema above that you wish to use JBatch tables under a different name (for example no table prefix and suffix) then during the Jbatch initialisation phase, JBatch will attempt to create these tables since they do not exist. However since the table constraint names already exist for the existing JBatch tables in the same schema, table creation will fail. One can of course run a sql script to create the relevant JBatch schema objects under different names.
