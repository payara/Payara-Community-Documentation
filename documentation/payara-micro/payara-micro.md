# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Starting an Instance](#3-starting-an-instance)
  * [3.1 Starting an Instance from the Command Line](#31-starting-an-instance-from-the-command-line)
  * [3.2 Starting an Instance Programmatically](#32-starting-an-instance-programmatically)
* [4. Deploying Applications](#4-deploying-applications)
  * [4.1 Deploying an Application from the Command Line](#41-deploying-an-application-from-the-command-line)
    * [4.1.1 Deploying Multiple Applications from the Command Line](#411-deploying-multiple-applications-from-the-command-line)
    * [4.1.2 Deploying Applications from a Maven Repository](#412-deploying-applications-from-a-maven-repository)
  * [4.2 Deploying Applications Programmatically](#42-deploying-applications-programmatically)
    * [4.2.1 Deploying an Application during Bootstrap](#421-deploying-an-application-programmatically-during-bootstrap)
      * [4.2.1.1 Deploying Multiple Applications Programmatically during Bootstrap](#4211-deploying-multiple-applications-programmatically-during-bootstrap)
    * [4.2.2 Deploying an Application Programmatically to Bootstrapped Instances](#422-deploying-an-application-programmatically-to-a-bootstrapped-instance)
      * [4.2.2.1 Deploying an Application to Multiple Bootstrapped Instances Programmatically](#4221-deploying-an-application-to-multiple-bootstrapped-instances-programmatically)
    * [4.2.3 Deploying an Application Programmatically from a Maven Repository](#423-deploying-an-application-programmatically-from-a-maven-repository)
      * [4.2.3.1 Deploying Multiple Applications from a Maven Repository](#4231-deploying-multiple-applications-from-a-maven-repository)
* [5. Configuring an Instance](#5-configuring-an-instance)
  * [5.1 Configuring an Instance from the Command Line](#51-configuring-an-instance-from-the-command-line)
    * [5.1.1 Precedence](#511-precedence)
  * [5.2 Configuring an Instance Programmatically](#52-configuring-an-instance-programmatically)
* [6. Stopping an Instance](#6-stopping-an-instance)
  * [6.1 Stopping an Instance from the Command Line](#61-stopping-an-instance-from-the-command-line)
  * [6.2 Stopping an Instance Programmatically](#62-stopping-an-instance-programmatically)
* [7. Payara Micro Automatic Clustering](#7-payara-micro-automatic-clustering)
* [8. Payara Micro and Maven](#8-payara-micro-and-maven)
* [9. Payara Micro HTTP and HTTPS Auto-Binding](#9-payara-micro-http-and-https-auto-binding)
* [10. Running Asadmin Commands on Bootstrapped Instances](#10-running-asadmin-commands-on-bootstrapped-instances)
* [11. Running Callable Objects on Bootstrapped Instances](#11-running-callable-objects-on-bootstrapped-instances)
* [12. Logging to a file](#12-logging-to-a-file)
  * [12.1 Logging to a file from the Command Line](#121-logging-to-a-file-from-the-command-line)
  * [12.2 Logging to a file Programmatically](#122-logging-to-a-file-programmatically)
* [13. Firing and Listening for CDI Events](#13-firing-and-listening-for-cdi-events)
* [14. Appendices](#14-appendices)
  * [14.1 Payara Micro Command Line Options](#141-payara-micro-command-line-options)
  * [14.2 Payara Micro API](#142-payara-micro-api)
    * [14.2.1 Configuration Methods](#1421-configuration-methods)
    * [14.2.2 Operation Methods](#1422-operation-methods)
      * [14.2.2.1 Deployment Methods](#14221-deployment-methods)
        * [14.2.2.1.1 PayaraMicro.class Methods](#142211-payaramicroclass-methods)
        * [14.2.2.1.2 PayaraMicroRuntime.class Methods](#142212-payaramicroruntimeclass-methods)
      * [14.2.2.2 Setup and Shutdown Methods](#14222-setup-and-shutdown-methods)
        * [14.2.2.2.1 PayaraMicro.class Methods](#142221-payaramicroclass-methods)
        * [14.2.2.2.2 PayaraMicroRuntime.class Methods](#142222-payaramicroruntimeclass-methods)
      * [14.2.2.3 CDI Methods](#14223-cdi-methods)
      * [14.2.2.4 Run Methods](#14224-run-methods)
      * [14.2.2.5 Get Methods](#14225-get-methods)
    * [14.2.3 Javadoc](#1423-javadoc)

# 1. Overview
This page shall cover how to use Payara Micro 4.1.1.162.  

Payara Micro is an embedded release of Payara built from the Payara Embedded Web release. It allows you to deploy and run WAR files from the command line with a single command, and also features automatic, dynamic clustering with Hazelcast.

# 2. Documentation Conventions
Any commands listed will be written assuming they are being run from the same directory as the Payara Micro JAR file.  

Any commands listed will also be written assuming that the system environment variables have been set up to have Java on the system Path.

Any paths listed throughout the documentation will use the Unix/Linux file path structure (forward slashes).

The owning class of an API method will not be explicitly stated unless it is not clear if an instance has been started or not; methods that operate on Payara Micro instances before they have been bootstrapped (instances that have not yet been started) are contained in the `PayaraMicro` class, whereas methods that operate on bootstrapped instances (running instances) are contained within the `PayaraMicroRuntime` class. 

# 3. Starting an Instance

See [Starting an Instance](starting-instance.md)

# 4. Deploying Applications

See [Deploying Applications](deploying/deploying.md)


## 4.2 Deploying Applications Programmatically

See [Deploying Programmatically](deploying/deploy-cmd-line.md)

# 4.3 Deploying an Exploded War

See [Deploying Applications](deploying/deploying.md)


# 5 Configuring an Instance

See [Configuring an Instance](configuring/configuring.md)

## 5.1 Configuring an Instance from the Command Line

See [Configuring an Instance from the Command Line](configuring/config-cmd-line.md)

## 5.2 Configuring an Instance Programmatically

See [Configuring an Instance Programmatically](configuring/config-program.md)

## 5.3 Packaging a Configured Instance as an Uber Jar

See [Packaging a Configured Instance as an Uber Jar](configuring/package-uberjar.md)

## 5.4 Configuring Payara Micro via System Properties

See [Configuring Payara Micro via System Properties](configuring/config-sys-props.md)

## 5.5 Configuring Alternate Keystores for SSL

See [Configuring Alternate Keystores for SSL](configuring/config-keystores.md)

# 6. Stopping an Instance

See [Stopping an Instance](stopping/stopping.md)

# 7. Payara Micro Automatic Clustering

See [Automatic Clustering](clustering/clustering.md)

# 8. Payara Micro and Maven

See [Maven Support](maven/maven.md)

# 9. Payara Micro HTTP and HTTPS Auto-Binding

See [HTTP and HTTPS Auto-Binding](port-autobinding.md)

# 10. Running Asadmin Commands on Bootstrapped Instances

See [Running Asadmin Commands on Bootstrapped Instances](asadmin.md)

# 11. Running Callable Objects on Bootstrapped Instances

See [Running Callable Objects on Bootstrapped Instances](callable-objects.md)

# 12. Firing and Listening for CDI Events

See [Firing and Listening for remote CDI Events](cdi-events.md)

# 14. Appendices

## 14.1 Payara Micro Command Line Options

Configuration Option | Description | Default Value
--- | --- | ---
`--noCluster` | Disables clustering for this instance. | _false_
`--port` | Sets the HTTP port that the instance will bind to. | 8080
`--sslPort` | Sets the HTTPs port that the instance will bind to. | If not set, has no value and HTTPS is disabled.
`--mcAddress` | Sets the cluster multicast group for the instance. | 224.2.2.4
`--mcPort` | Sets the cluster multicast port. | 2904
`--startPort` | Sets the cluster start port number. | 5900
`--clusterName`| Sets the cluster group name |
`--clusterPassword` | Sets the cluster group password |
`--name` | Sets the instance name. | Generated Universally Unique Identifier.
`--rootDir` | Sets the root configuration directory and saves the configuration across restarts. | If not set, has no value and defaults to the temp directory.
`--deploymentDir` | Sets a directory which will be scanned for WAR files for auto-deployment. | If not set, has no value and is not used.
`--deploy` | Specifies a WAR file to deploy. | If not set, has no value and is not used.
`--domainConfig` | Overrides the server configuration with an alternative domain.xml file. | If not set, the domain.xml contained in the Payara Micro JAR is used.
`--minHttpThreads` | Sets the minimum number of threads in the HTTP thread pool. | 10
`--maxHttpThreads` | Sets the maximum number of threads in the HTTP thread pool. | 10
`--hzConfigFile` | Sets the Hazelcast configuration file to use for overriding the in-built Hazelcast cluster configuration. | if not set, the in-built Hazelcast configuration file is used.
`--autoBindHttp` | Enables auto-binding for the HTTP port | _false_
`--autoBindSsl` | Enables auto-binding for the HTTPS port | _false_
`--autoBindRange` | Sets the range for HTTP and HTTPS port auto-binding. | 5
`--lite` | sets the micro container to lite mode which means it clusters with other Payara Micro instances but does not store clustered data | |
`--outputUberJar` |  packages up an uber jar at the specified path based on the command line arguments and exits | |
`--systemProperties` | Reads system properties from a file | |
`--logo` | Reveals the #BadAssFish or a custom logo on boot | |
`--disablePhoneHome` | Disables _Phone Home_ activities for this instance | If not set, _Phone Home_ is active
`--logToFile` | Outputs all the Log entries to a user defined file
`--help` | Displays the configuration options and then exits. | If not set, this option is not used.

## 14.2 Payara Micro API
This section contains documentation on the Payara Micro API.

### 14.2.1 Configuration Methods
This section details the PayaraMicro.class configuration methods that are used during the bootstrap process.

Configuration Operand | Description | Get Method | Set Method | Default Value | Command Line Equivalent
--- | --- | --- | --- | --- | ---
Alternate Domain XML | Gets or sets the domain.xml used to override the default server configuration. | `File getAlternateDomainXML()` | ` PayaraMicro setAlternateDomainXML(File alternateDomainXML)` | `null` | `--domainConfig`
Cluster Multicast Group | Gets or sets the cluster multicast group for the instance. | `String getClusterMulticastGroup()` | `PayaraMicro setClusterMulticastGroup(String hzMulticastGroup)` | `null` (Default value of 224.2.2.4 set in default domain.xml is not read into instance variable) | `--mcAddress`
Cluster Port | Gets or sets the multicast cluster port. | `int getClusterPort()` | `PayaraMicro setClusterPort(int hzPort)` | -2147483648 (MIN_VALUE) (Default value of 2904 set in default domain.xml is not read into instance variable) | `--mcPort`
Cluster Start Port | Gets or sets the start port number for the Payara Micro instance to listen on for cluster communications. | `int getClusterStartPort()` | `PayaraMicro setClusterStartPort(int hzStartPort)` | -2147483648 (MIN_VALUE) (Default value of 5900 set in default configuration files is not read into instance variable) | `--startPort`
Deployment Directory | Gets or sets the directory to be scanned for archives to deploy. | `File getDeploymentDir()` | `PayaraMicro setDeploymentDir(File deploymentRoot)` | `null` | `--deploymentDir`
HTTP Port | Gets or sets the HTTP port for the instance to bind to. | `int getHttpPort()` | `PayaraMicro setHttpPort(int httpPort)` | -2147483648 (MIN_VALUE) (Default value of 8080 set in default domain.xml is not read into instance variable) | `--port`
Instance Name | Gets or sets the name of the instance. | `String getInstanceName()` | `PayaraMicro setInstanceName(String instanceName)` | Generated Universally Unique Identifier. | `--name`
Maximum HTTP Threads | Gets or sets the maximum number of threads in the HTTP thread pool. | `int getMaxHttpThreads()` | `PayaraMicro setMaxHttpThreads(int maxHttpThreads)` | -2147483648 (MIN_VALUE) (Default value of 10 set in default domain.xml is not read into instance variable) | `--maxHttpThreads`
Minimum HTTP Threads | Gets or sets the minimum number of threads in the HTTP thread pool. | `int getMinHttpThreads()` | `PayaraMicro setMinHttpThreads(int minHttpThreads)` | -2147483648 (MIN_VALUE) (Default value of 10 set in default domain.xml is not read into instance variable) | `--minHttpThreads`
Root Directory | Gets or sets the root configuartion directory. | `File getRootDir()` | `PayaraMicro setRootDir(File rootDir)` | `null` | `--rootDir`
HTTPS Port | Gets or sets the HTTPS port for the instance to bind to. A HTTPS port is not bound unless this value is manually set. | `int getSslPort()` | `PayaraMicro setSslPort(int sslPort)` | -2147483648 (MIN_VALUE) (Default value of 8443 set in default domain.xml is not read into instance variable) | `--sslPort`
No Clustering | Gets or sets whether clustering is enabled or disabled for an instance. | `boolean isNoCluster()` | `PayaraMicro setNoCluster(boolean noCluster)` | _false_ | 
HTTP Auto-Binding | Enables or Disables auto-binding of the HTTP port for an instance. | `boolean getHttpAutoBind()` | `PayaraMicro setHttpAutoBind(boolean httpAutoBind)` | _false_ | `--autoBindHttp`
HTTPS Auto-Binding | Enables or Disables auto-binding of the HTTPS port for an instance. | `boolean getSslAutoBind()` | `PayaraMicro setSslAutoBind(boolean sslAutoBind)` | _false_ | `--autoBindSsl`
Auto-Bind Range | Sets the range for HTTP and HTTPS port auto-binding. | `int getAutoBindRange()` | `PayaraMicro setAutoBindRange(int autoBindRange)` | 5 | `--autoBindRange`

### 14.2.2 Operation Methods
This section details the other methods of the Payara Micro API that operate Payara Micro instances. `PayaraMicro.class` methods are used during the bootstrap process, whereas `PayaraMicroRuntime.class` methods are used on running instances.

#### 14.2.2.1 Deployment Methods
This section details the methods used for the deployment of applications to Payara Micro instances.

##### 14.2.2.1.1 PayaraMicro.class Methods
Method | Description | Command Line Equivalent
--- | --- | --- | ---
`PayaraMicro addDeployment(String pathToWar)` | Adds the file found at the location of the `pathToWar` parameter to the list of files to be deployed upon starting the instance. | `--deploy`
`PayaraMicro addDeploymentFile(File file)` | Adds the file associated with the `file` parameter to the list of files to be deployed upon starting the instance. | `--deploy`

##### 14.2.2.1.2 PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`boolean deploy(String name, InputStream is)` | Deploys an application from an InputStream with the name specified.
`boolean deploy(String name, String contextRoot, InputStream is)` | Deploys an application from an InputStream, with the specified name and context root.
`boolean deploy(File war)` | Deploys the application located at the _war_ parameter path.
`boolean undeploy(String name)` | Un-deploys the specified application.

#### 14.2.2.2 Setup and Shutdown Methods
This section details the methods required for setting up Payara Micro instances.

##### 14.2.2.2.1 PayaraMicro.class Methods
Method | Description
--- | ---
`PayaraMicroRuntime bootStrap() throws BootstrapException` | Checks the supplied configuration parameters and starts a Payara Micro instance.
`PayaraMicro getInstance()` | Obtains the static singleton instance of the Payara Micro server. If one does not exist, one will be created and returned.
`PayaraMicro getInstance(boolean create)` | Obtains the static singleton instance of the Payara Micro server. If one does not exist and `create` is set to true, one will be created and returned, otherwise returns _null_.
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

##### 14.2.2.2.2 PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

#### 14.2.2.3 CDI Methods
This section details the methods used for firing CDI Events across running instances.

Method | Description
--- | ---
`void addCDIEventListener(CDIEventListener listener)` | Adds a CDI Event Listener.
`void removeCDIEventListener(CDIEventListener listener)` | Removes a CDI Event Listener.
`void addClusterListener(PayaraClusterListener listener)` | Adds a Cluster Listener.
`void removeClusterListener(PayaraClusterListener listener)` | Removes a Cluster Listener.
`void publishCDIEvent(PayaraClusteredCDIEvent event)` | Publishes a CDI Event.

#### 14.2.2.4 Run Methods
This section details the methods used for running _asadmin_ commands or _Callable_ objects on bootstrapped instances.

Method | Description
--- | ---
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (String command, String... args )` | Runs an asadmin command on all members of a Payara Micro Cluster.
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (Collection<InstanceDescriptor> members, String command, String... args )` | Runs an asadmin command on specified members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Callable<T> callable)` | Runs a Callable object on all members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Collection<InstanceDescriptor> members, Callable<T> callable)` | Runs a Callable object on specified members of a Payara Micro Cluster.

#### 14.2.2.5 Get Methods
This section details the methods used for getting information on running Payara Micro instances. For information on the _Get_ methods of an un-bootstrapped instance, see the [Configuration Methods section](#1421-configuration-methods).

Method | Description
--- | ---
`Collection<InstanceDescriptor> getClusteredPayaras()` | Returns a collection of instance descriptors for all the Payara Micros instances in a cluster.
`Collection<String> getDeployedApplicationNames()` | Returns the names of the deployed applications.
`String getInstanceName()` | Returns the instance name.
`InstanceDescriptor getLocalDescriptor()` | Returns the instance descriptor of the instance the method is run on.

### 14.2.3 Javadoc

The Javadoc for the most recent version of the Payara Micro API can be found here: http://payara.github.io/Payara/nucleus_API/payara-modules/payara-micro/target/apidocs/
