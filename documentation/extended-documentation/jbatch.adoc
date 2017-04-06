# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Defining a Schema name](#3-defining-a-schema-name)
  * [3.1 Defining a Schema name through the Admin Console](#31-defining-a-schema-name-through-the-admin-console)
  * [3.2 Defining a Schema name using Asadmin](#32-defining-a-schema-name-using-asadmin)
  * [3.3 Defining a Schema name in the domain.xml file](#33-defining-a-schema-name-in-the-domainxml-file)
  * [3.4 Specifying a Blank Schema Name](#34-specifying-a-blank-schema-name)
* [4. Setting a Table Prefix and/or Suffix](#4-setting-a-table-prefix-andor-suffix)
  * [4.1 Setting a Table Prefix and/or Suffix through the Admin Console](#41-setting-a-table-prefix-andor-suffix-through-the-admin-console)
  * [4.2 Setting a Table Prefix and/or Suffix using Asadmin](#42-setting-a-table-prefix-andor-suffix-using-asadmin)
  * [4.3 Setting a Table Prefix and/or Suffix in the domain.xml file](#43-setting-a-table-prefix-andor-suffix-in-the-domainxml-file)
* [5. Using MySQL, PostgreSQL, Oracle, or DB2 with JBatch](#5-using-mysql-postgresql-oracle-or-db2-with-jbatch)
  * [5.1 Usage Restrictions](#51-usage-restrictions)
  * [5.2 MySQL](#52-mysql)
* [6. Altered Asadmin Commands](#6-altered-asadmin-commands)
  * [6.1 set-batch-runtime-configuration](#61-set-batch-runtime-configuration)
  
  
# 1. Overview
This page shall cover how to use the additional JBatch functionality in Payara 4.1.1.162.  

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
To specify the schema name, use the _--schemaName_ option, or its shortcut _-n_.  
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

## 3.4 Specifying a Blank Schema Name
If you specify a blank schema name, then the schema name will depend on the type of database being used. MySQL will use _test_, whereas Derby, Oracle, DB2 and PostgreSQL will use the username of the JDBC connection pool resource associated with the JDBC resource to which JBatch is configured to use. Take note that this only applies if you explicitly specify the schema name as blank; the schema name will still default to _APP_ if not overwritten.

# 4. Setting a Table Prefix and/or Suffix
This release of Payara allows you to set the prefix and/or the suffix of the batch table name. This can be set via the Admin Console, in the _domain.xml_ file, or using Asadmin commands.  
  _Note - the table prefix and suffix settings may be ignored by non-RDBMS based datastores_.
## 4.1 Setting a Table Prefix and/or Suffix through the Admin Console
* Click on the instance or cluster to move to its configuration page.
* Select the _Batch_ tab, and the _Configuration_ sub-tab should load.
* Enter your desired values in the _Table Prefix_ and _Table Suffix_ fields.
* Save your changes

## 4.2 Setting a Table Prefix and/or Suffix using Asadmin
This is set using the `set-batch-runtime-configuration` command.  
The command requires you to specify the Executor or Datasource lookup name, which you can do with the _-x_ or _-d_ options respectively.  
The command defaults to targeting the Admin Server instance (_server_), to target a different instance or cluster, use the _--target_ option.  
TO specify the prefix, use the _--tablePrefix_ option.  
TO specify the table suffic, use the _--tableSuffix_ option.
An example can be seen below:  

`asadmin set-batch-runtime-configuration -d jdbc/__default --target cluster1 --tablePrefix PRE --tableSuffix SFX`  

This command expects the Admin Server to be listening on port 4848. If it is not, use the _-p_ option to specify the port, for example:  
`asadmin -p 5048 set-batch-runtime-configuration -d jdbc/__default --target cluster1 --tablePrefix PRE --tableSuffix SFX`  

## 4.3 Setting a Table Prefix and/or Suffix in the domain.xml file
* Open up the _domain.xml_ file of the domain in question to edit.
  * It can be found under _${Product\_Root}/glassfish/domains/${Domain}/config/_  
* Find the _\<batch-runtime-configuration\>_ tag under the appropriate _\<config\>_ tag (e.g. _\<config name="server-config"\>_ for the Admin Server), and enter the table prefix and/or suffix like so:  
`<batch-runtime-configuration table-prefix="PRE" table-suffix="SFX"></batch-runtime-configuration>`
  * Note - If you're editing the _domain.xml_ of a domain that has not been started at least once, the _batch-runtime-configuration_ tag will not exist and you will have to add it in yourself  

# 5. Using MySQL, PostgreSQL, Oracle, or DB2 with JBatch
You configure JBatch to use each of these in the same way that you would configure it to use Derby.  

In the Admin Console:
* Create a Connection Pool:
  * Navigate to _Resources_ > _JDBC_ > _JDBC Connection Pools_ and click on _New..._
  * Give it a name in the _Pool Name_ field, select the resource type from the _Resource Type_ drop-down, and choose the _Database Driver Vendor_ as either DB2, MySql, Oracle, or Postgresql from the _Database Driver Vendor_ menu.
  * Set any further configuration options on the next page.
  * Click _Finish_
* Create a JDBC Resource:
  * Navigate to _Resources_ > _JDBC_ > _JDBC Resources_ and click on _New..._
  * Give it a name in the _JNDI Name_ field, and select the datasource you just created from the _Pool Name_ drop-down.
  * Add any additional properties and select the targets for it to be enabled on.
  * Click _OK_.
* Navigate to the Batch configuration page of the instance or cluster:
  * Click on the instance or cluster to move to its configuration page.
  * Select the _Batch_ tab, and the _Configuration_ sub-tab should load.
* Select the new datasource from the _Data Source Lookup Name_ drop-down menu.
* Save the changes.

## 5.1 Usage Restrictions

JBatch will not create internally more than one set of Jbatch tables per schema. So in your schema if there exists a set of JBatch tables with prefixes and suffixes in the table names and then specify in the Glassfish JBatch configuration for the same schema above that you wish to use JBatch tables under a different name (for example no table prefix and suffix) then during the Jbatch initialisation phase, JBatch will attempt to create these tables since they do not exist. However since the table constraint names already exist for the existing JBatch tables in the same schema, table creation will fail. One can of course run a sql script to create the relevant JBatch schema objects under different names.

## 5.2 MySQL

For MySQL database use, it is recommended the following additional property be set:

| Name | Value | Description |
|-----------------------------|----------|-------------------------------------------------------------------|
| zeroDateTimeBehavior | convertToNull | Action for DATETIME values that are composed entirely of zeros (used by MySQL to represent invalid dates) |

Depending on the version of MySQL you may also need to set the server property sql_mode to blank as JBatch uses null and zero dates.

# 6. Altered Asadmin Commands

## 6.1 set-batch-runtime-configuration
Sets the batch runtime configuration settings. This command requires the admin server to be running.

| Option | Shortcut | Description | Default | Mandatory |
|-----------------------------|----------|-------------------------------------------------------------------|---------|---------------------------------------------|
| --target |  | The instance or cluster to set the JBatch configuration of. | server | No |
| --datasourcelookupname | -d | Sets the name of the datasource to lookup and use. |  | Yes, or specify _executorServiceLookupName_ |
| --executorservicelookupname | -x | Sets the name of the executor service to lookup and use. |  | Yes, or specify _datasourceLookupName_ |
| --schemaName | -n | Sets the name of the database schema that holds the batch tables. | APP | No |
| --tablePrefix |  | Sets the prefix to apply to the batch table name. |  | No |
| --tableSuffix |  | Sets the suffix to apply to the batch table name. |  | No |
