# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Starting an Instance](#3-starting-an-instance)
  * [3.1 Starting an Instance from the Command Line](#31-starting-an-instance-from-the-command-line)
  * [3.2 Starting an Instance Programmatically](#32-starting-an-instance-programmatically)
* [4. Deploying an Application](#4-deploying-an-application)
  * [4.1 Deploying an Application from the Command Line](#41-deploying-an-application-from-the-command-line)
    * [4.1.1 Deploying Multiple Applications from the Command Line](#411-deploying-multiple-applications-from-the-command-line)
  * [4.2 Deploying an Application Programmatically](#42-deploying-an-application-programmatically)
    * [4.2.1 Deploying Multiple Applications Programmatically](#421-deploying-multiple-applications-programmatically)
* [5. Configuring an Instance](#5-configuring-an-instance)
  * [5.1 Configuring an Instance from the Command Line](#51-configuring-an-instance-from-the-command-line)
  * [5.2 Configuring an Instance Programmatically](#52-configuring-an-instance-programmatically)
* [6. Stopping an Instance](#6-stopping-an-instance)
  * [6.1 Stopping an Instance from the Command Line](#61-stopping-an-instance-from-the-command-line)
  * [6.2 Stopping an Instance Programmatically](#62-stopping-an-instance-programmatically)
* [7. Payara Micro Automatic Clustering](#7-payara-micro-automatic-clustering)
* [8. Payara Micro and Maven](#8-payara-micro-and-maven)
* [9. Appendices](#9-appendices)
  * [9.1 Payara Micro Command Line Options](#91-payara-micro-command-line-options)
  * [9.2 Payara Micro API](#92-payara-micro-api)
    * [9.2.1 Configuration Methods](#921-configuration-methods)
    * [9.2.2 Operation Methods](#922-operation-methods)
      * [9.2.2.1 Deployment Methods](#9221-deployment-methods)
      * [9.2.2.2 Setup and Shutdown Methods](#9222-setup-and-shutdown-methods)

# 1. Overview
This page shall cover how to use Payara Micro 4.1.152.1.  

Payara Micro is an embedded release of Payara built from the Payara Embedded Web release. It allows you to deploy and run WAR files from the command line with a single command, and also features automatic, dynamic clustering with Hazelcast.

# 2. Documentation Conventions
Any commands listed will be written assuming they are being run from the same directory as the Payara Micro JAR file.  

Any commands listed will also be written assuming that the system environment variables have been set up to have Java on the system Path.

Any paths listed throughout the documentation will use the Unix/Linux file path structure (forward slashes).

# 3. Starting an Instance
This section details the very basics of starting an instance.

## 3.1 Starting an Instance from the Command Line
To start an instance of Payara Micro from the command line, you simply run the JAR:  

```Shell
java -jar payara-micro.jar
```

This single command is all you need to run Payara Micro instances; additional configuration options are all a part of this command.

## 3.2 Starting an Instance Programmatically
You need to import two classes from the fish.payara.micro package (contained in the Payara Micro JAR, see [section 8](#8-payara-micro-and-maven) for instructions on importing this JAR with Maven):  

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
```

You can then start an instance by calling the `getInstance()` and `bootstrap()` methods from the PayaraMicro class. 
This initialisation will throw a _BootstrapException_ exception, so you will need to surround it with a try-catch, or have the parent method throw the exception.

A simple example is as follows:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicro.getInstance().bootStrap();
    }    
}
```

# 4. Deploying an Application
This section details how to deploy an application.

## 4.1 Deploying an Application from the Command Line
As noted in [section 3.1](#31-starting-an-instance-from-the-command-line), all Payara Micro actions are run for the Payara Micro JAR, all in one command; it is not possible to start an instance with one command, and deploy an application to it with another.

The general structure of starting, configuring, and deploying an application to an instance is as follows:

```Shell
java -jar payara-micro.jar _--option1_ _--option2_ ...
```

To deploy a WAR file to an instance, you need to use the `--deploy` option, followed by the path to the application to deploy. 
See below for an example of starting a Payara Micro instance and deploying a WAR file:

```Shell
java -jar payara-micro.jar --deploy /home/user/example.war
```

### 4.1.1 Deploying Multiple Applications from the Command Line
If you want to deploy multiple applications to an instance with the ``--deploy` option, you must use it once for each application to be deployed; it does not accept multiple paths.

For example, to deploy two applications:

```Shell
java -jar payara-micro.jar --deploy /home/user/example.war --deploy /home/user/test.war
```

Alternatively, you can use the `--deploymentDir` option. This option specifies a directory to scan for deployable archives, allowing you to store all of the applications you wish to be deployed in a directory, and have them be deployed automatically upon instance startup.

```Shell
java -jar payara-micro.jar --deploymentDir /home/user/deployments
```

## 4.2 Deploying an Application Programmatically
There are two methods you can use to deploy an application: `addDeployment(String pathToWar)`, and `addDeploymentFile(File file)`.

The first, `addDeployment(String pathToWar)`, accepts a String that points to the path of the file to be deployed. For example:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().addDeployment(/home/user/example.war).bootStrap();
    }
}
```

The second method, `addDeploymentFile(File file)`, functions in the same way as the `addDeployment(String pathToWar)` method, but takes a File object as its parameter instead:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File file = new File("/home/user/example.war");
        PayaraMicro.getInstance().addDeploymentFile(file).bootStrap();
    }
}
```

Unlike when controlling Payara Micro from the command line, you can split the instance initialisation and configuration across multiple lines methods. For example, to deploy an application on one line, and start the instance on another:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.addDeployment("/home/user/example.war");
        micro.bootStrap();
    }
}
```

You **cannot**, however, configure an instance any further once it has been started (with the `bootstrap()` method).

### 4.2.1 Deploying Multiple Applications Programmatically
Similar to when deploying multiple applications from the command line, you must use call the `addDeployment` or `addDeploymentFile` method for each application you wish to deploy.

For example, to deploy three applications:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        
        micro.addDeployment("/home/user/example.war");
        micro.addDeployment("/home/user/test.war");
        micro.addDeployment("/home/user/three.war");
        
        micro.bootStrap();
    }
}
```

Alternatively, you can use the programmatic equivalent of the `--deploymentDir` command line option (described in [section 4.1.1](#411-deploying-multiple-applications-from-the-command-line)): the `setDeploymentDir(File deploymentRoot)` method:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File deployments = new File("/home/user/deployments/");
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.setDeploymentDir(deployments);
        micro.bootStrap();
    }
}
```

# 5. Configuring an Instance
This section details how to configure a Payara Micro instance.

## 5.1 Configuring an Instance from the Command Line
As described in [section 4.1](#41-deploying-an-application-from-the-command-line), the starting and configuration of an instance has to be done in its entirety on one line.

The options available can be seen by running the JAR with the `--help` option, or by consulting the [Payara Micro Command Line Options](#91-payara-micro-command-line-options) section in the [Appendices](#9-appendices).

The general structure of starting, configuring, and deploying an application to an instance is as follows:

```Shell
java -jar payara-micro.jar _--option1_ _--option2_ ...
```

As an example, see below for starting an instance with a non-default HTTP port:

```Shell
java -jar payara-micro.jar --port 2468
```

## 5.2 Configuring an Instance Programmatically
There are various methods available for configuring a Payara Micro instance programmatically.

The configuration methods available to you should be detected by your IDE, allowing you to view them using the auto-complete feature common to most popular IDEs. Alternatively, you can consult the [Payara Micro Configuration Methods](#921-payara-micro-configuration-methods) section in the [Appendices](#9-appendices).

As noted before, in the [Deploying an Application Programmatically](#42-deploying-an-application-programmatically) section, you can either call the desired configuration commands on one line during instance initialisation, or on separate lines after creating a `PayaraMicro` variable.

As also noted in the same section: you **cannot** configure an instance any further once it has been bootstrapped.

As an example of configuring an instance to use a different HTTP and Cluster start port on one line, see here:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().setHttpPort(2468).setClusterStartPort(5902).bootStrap();
    }
}
```

For the example of the same, but done across multiple lines, see here:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.setHttpPort(2468);
        micro.setClusterStartPort(5902);
        micro.bootStrap();
    }
}
```

# 6. Stopping an Instance
This section describes how to shut down a Payara Micro instance.

## 6.1 Stopping an Instance from the Command Line
There is no specific option for shutting down a Payara Micro instance.
The only way to shut down an instance from the command line is to find the process ID of the Payara Micro instance, and send a kill signal to it.

## 6.2 Stopping an Instance Programmatically
To shut down a Payara Micro instance programmatically, you will need to use the `shutdown()` method of the `PayaraMicro` class.

You must call this method specifically on the instance of Payara Micro that you want to shut down, so will realistically only be used on a `PayaraMicro` instance variable:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.bootStrap();
        
        micro.shutdown();
    }
}
```

# 7. Payara Micro Automatic Clustering
This section details how the Payara Micro automatic clustering works.

The integration of Hazelcast into Payara Micro allows instances to automatically, and dynamically, cluster together. When two instances are pointed at the same multicast address and port, they will automatically cluster together. 

You can see evidence of the automatic clustering by simply starting two instances (with different HTTP port configurations), and you should see the following in the log output:

```
Members [2] {
        Member [192.168.174.130]:5900 this
        Member [192.168.174.130]:5901
```

The `--startPort` option is used to determine which port the Payara Micro instance will **first** try to bind to, if the port is already bound to (say, by another Payara Micro instance), then the Payara Micro instance will simply increment the _startPort_ value and try again until it finds a port it can bind to.

For example, if there are already two Payara Micro instances running, which have bound ports 5900 and 5901, then a third instance started with a _startPort_ value of 5900 will first try to bind to 5900, then to 5901, then finally settle on 5902.

If you wish to have multiple clusters, then you can make use of the `--mcAddress` and ``mcPort` options to define a different multicast address and port; assign a different address and port to each set of instances you wish to operate in a separate cluster and they will automatically make their own cluster on the new multicast address and port.

# 8. Payara Micro and Maven
Payara Micro has been uploaded to Maven central, allowing you to include it as a dependency in your POM. This allows you to easily add the required Payara Micro classes and methods to your application to use Payara Micro programmatically.

In your project's POM, include the following dependency:

```MAVEN_POM
<dependency>
    <groupId>fish.payara.extras</groupId>
    <artifactId>payara-micro</artifactId>
    <version>4.1.152.1</version>
</dependency>
```

# 9. Appendices

## 9.1 Payara Micro Command Line Options

Configuration Option | Description | Default Value
--- | --- | ---
`--noCluster` | Disables clustering for this instance. | _false_
`--port` | Sets the HTTP port that the instance will bind to. | 8080
`--sslPort` | Sets the HTTPs port that the instance will bind to. | If not set, has no value and HTTPS is disabled.
`--mcAddress` | Sets the cluster multicast group for the instance. | 224.2.2.4
`--mcPort` | Sets the cluster multicast port. | 2904
`--startPort` | Sets the cluster start port number. | 5900
`--name` | Sets the instance name. | Generated Universally Unique Identifier.
`--rootDir` | Sets the root configuration directory and saves the configuration across restarts. | If not set, has no value and defaults to the temp directory.
`--deploymentDir` | Sets a directory which will be scanned for WAR files for auto-deployment. | If not set, has no value and is not used.
`--deploy` | Specifies a WAR file to deploy. | If not set, has no value and is not used.
`--domainConfig` | Overrides the server configuration with an alternative domain.xml file. | If not set, the domain.xml contained in the Payara Micro JAR is used.
`--minHttpThreads` | Sets the minimum number of threads in the HTTP thread pool. | 10
`--maxHttpThreads` | Sets the maximum number of threads in the HTTP thread pool. | 10
`--help` | Displays the configuration options and then exits. | If not set, this option is not used.

## 9.2 Payara Micro API
This section contains documentation on the Payara Micro API.

### 9.2.1 Configuration Methods
This section details the instance configuration methods of the Payara Micro API.

Configuration Operand | Description | Get Method | Set Method | Default Value | Command Line Equivalent
--- | --- | --- | --- | --- | ---
Alternate Domain XML | Gets or sets the domain.xml used to override the default server configuration. | `File getAlternateDomainXML()` | ` PayaraMicro setAlternateDomainXML(File alternateDomainXML)` | `null` | `--domainConfig`
Cluster Multicast Group | Gets or sets the cluster multicast group for the instance. | `String getClusterMulticastGroup()` | `Payara Micro setClusterMulticastGroup(String hzMulticastGroup)` | `null` (Default value of 224.2.2.4 set in default domain.xml is not read into instance variable) | `--mcAddress`
Cluster Port | Gets or sets the multicast cluster port. | `int getClusterPort()` | `Payara Micro setClusterPort(int hzPort)` | -2147483648 (MIN_VALUE) (Default value of 2904 set in default domain.xml is not read into instance variable) | `--mcPort`
Cluster Start Port | Gets or sets the start port number for the Payara Micro instance to listen on for cluster communications. | `int getClusterStartPort()` | `Payara Micro setClusterStartPort(int hzStartPort)` | -2147483648 (MIN_VALUE) (Default value of 5900 set in default configuration files is not read into instance variable) | `--startPort`
Deployment Directory | Gets or sets the directory to be scanned for archives to deploy. | `File getDeploymentDir()` | `Payara Micro setDeploymentDir(File deploymentRoot)` | `null` | `--deploymentDir`
HTTP Port | Gets or sets the HTTP port for the instance to bind to. | `int getHttpPort()` | `Payara Micro setHttpPort(int httpPort)` | -2147483648 (MIN_VALUE) (Default value of 8080 set in default domain.xml is not read into instance variable) | `--port`
Instance Name | Gets or sets the name of the instance. | `String getInstanceName()` | `PayaraMicro setInstanceName(String instanceName)` | Generated Universally Unique Identifier. | `--name`
Maximum HTTP Threads | Gets or sets the maximum number of threads in the HTTP thread pool. | `int getMaxHttpThreads()` | `Payara Micro setMaxHttpThreads(int maxHttpThreads)` | -2147483648 (MIN_VALUE) (Default value of 10 set in default domain.xml is not read into instance variable) | `--maxHttpThreads`
Minimum HTTP Threads | Gets or sets the minimum number of threads in the HTTP thread pool. | `int getMinHttpThreads()` | `Payara Micro setMinHttpThreads(int minHttpThreads)` | -2147483648 (MIN_VALUE) (Default value of 10 set in default domain.xml is not read into instance variable) | `--minHttpThreads`
Root Directory | Gets or sets the root configuartion directory. | `File getRootDir()` | `Payara Micro setRootDir(File rootDir)` | `null` | `--rootDir`
HTTPS Port | Gets or sets the HTTPS port for the instance to bind to. A HTTPS port is not bound unless this value is manually set. | `int getSslPort()` | `PayaraMicro setSslPort(int sslPort)` | -2147483648 (MIN_VALUE) (Default value of 8443 set in default domain.xml is not read into instance variable) | `--sslPort`
No Clustering | Gets or sets whether clustering is enabled or disabled for an instance. | `boolean isNoCluster()` | `PayaraMicro setNoCluster(boolean noCluster)` | _false_ | 

### 9.2.2 Operation Methods
This section details the other methods of the Payara Micro API that operate Payara Micro instances.

#### 9.2.2.1 Deployment Methods
This section details the methods used for the deployment of applications to Payara Micro instances.

Method | Description | Default Value | Command Line Equivalent
--- | --- | --- | ---
`PayaraMicro addDeployment(String pathToWar)` | Adds the file found at the location of the `pathToWar` parameter to the list of files to be deployed upon starting the instance. | N/A | `--deploy`
`PayaraMicro addDeploymentFile(File file)` | Adds the file associated with the `file` parameter to the list of files to be deployed upon starting the instance. | N/A | `--deploy`

#### 9.2.2.2 Setup and Shutdown Methods
This section details the methods required for setting up Payara Micro instances.

Method | Description
`void bootStrap() throws BootstrapException` | Checks the supplied configuration parameters and starts a Payara Micro instance.
`PayaraMicro getInstance()` | Obtains the static singleton instance of the Payara Micro server. If one does not exist, one will be created and returned.
`PayaraMicro getInstance(boolean create)` | Obtains the static singleton instance of the Payara Micro server. If one does not exist and `create` is set to true, one will be created and returned, otherwise returns _null_.
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.