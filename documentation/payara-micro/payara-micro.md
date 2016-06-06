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
    * [4.2.3 Deploying an Application Programmatically from a Maven Repository] (#423-deploying-an-application-programmatically-from-a-maven-repository)
      * [4.2.3.1 Deploying Multiple Applications from a Maven Repository] (#4231-deploying-multiple-applications-from-a-maven-repository)
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
* [12. Firing and Listening for CDI Events](#12-firing-and-listening-for-cdi-events)
* [13. Appendices](#13-appendices)
  * [13.1 Payara Micro Command Line Options](#131-payara-micro-command-line-options)
  * [13.2 Payara Micro API](#132-payara-micro-api)
    * [13.2.1 Configuration Methods](#1321-configuration-methods)
    * [13.2.2 Operation Methods](#1322-operation-methods)
      * [13.2.2.1 Deployment Methods](#13221-deployment-methods)
        * [13.2.2.1.1 PayaraMicro.class Methods](#132211-payaramicroclass-methods)
        * [13.2.2.1.2 PayaraMicroRuntime.class Methods](#132212-payaramicroruntimeclass-methods)
      * [13.2.2.2 Setup and Shutdown Methods](#13222-setup-and-shutdown-methods)
        * [13.2.2.2.1 PayaraMicro.class Methods](#132221-payaramicroclass-methods)
        * [13.2.2.2.2 PayaraMicroRuntime.class Methods](#132222-payaramicroruntimeclass-methods)
      * [13.2.2.3 CDI Methods](#13223-cdi-methods)
      * [13.2.2.4 Run Methods](#13224-run-methods)
      * [13.2.2.5 Get Methods](#13225-get-methods)
    * [13.2.3 Javadoc](#1323-javadoc)

# 1. Overview
This page shall cover how to use Payara Micro 4.1.1.162.  

Payara Micro is an embedded release of Payara built from the Payara Embedded Web release. It allows you to deploy and run WAR files from the command line with a single command, and also features automatic, dynamic clustering with Hazelcast.

# 2. Documentation Conventions
Any commands listed will be written assuming they are being run from the same directory as the Payara Micro JAR file.  

Any commands listed will also be written assuming that the system environment variables have been set up to have Java on the system Path.

Any paths listed throughout the documentation will use the Unix/Linux file path structure (forward slashes).

The owning class of an API method will not be explicitly stated unless it is not clear if an instance has been started or not; methods that operate on Payara Micro instances before they have been bootstrapped (instances that have not yet been started) are contained in the `PayaraMicro` class, whereas methods that operate on bootstrapped instances (running instances) are contained within the `PayaraMicroRuntime` class. 

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

You can then start an instance with default settings by calling the `bootstrap()` method from the PayaraMicro class. 
This initialisation will throw a _BootstrapException_ exception, so you will need to surround it with a try-catch, or have the parent method throw the exception.

A simple example is as follows:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicro.bootstrap();
    }    
}
```

To start an instance with non-default settings (configuration changes or deploying applications upon startup), you have to call the `getInstance()` method before using `bootstrap()`. More details on this can be found in the [Configuring an Instance](#52-configuring-an-instance-programmatically) section.
The use of the `getInstance()` method does not exclude you from using the default settings however; calling the `bootstrap()` method on its own (as shown in the example above) is functionally equivalent to calling the `bootstrap()` method directly after the `getInstance()` method, such as in the example below:

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

The `bootStrap()` method returns a `PayaraMicroRuntime` object instance, which is comes with various methods that afford you control over the instance and its cluster after you have bootstrapped it. To take advantage of this, you have to initialise a `PayaraMicroRuntime` object from the `bootStrap` method, like so:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicroRuntime instance = PayaraMicro.bootStrap();
    }    
}
```

# 4. Deploying Applications
This section details how to deploy applications.

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

### 4.1.2 Deploying Applications from a Maven repository
You can deploy an application directly from a Maven repository using the `--deployFromGAV` option. This option accepts a comma separated string denoting a maven artefact's _groupId_, _artifactId_, and _version_ attributes.

```Shell
java -jar payara-micro.jar --deployFromGAV "fish.payara.examples,test,1.0-SNAPSHOT"
```

This option can be used multiple times, and in conjunction with the standard `--deploy` options, as described in section [4.1.1](#411-deploying-multiple-applications-from-the-command-line).

By default, Payara Micro will only search for artefacts in the Maven Central repository. If you wish to search additional repositories, you can add them to the list of repositories to search with the `--additionalRepository` option:

```Shell
java -jar payara-micro.jar --deployFromGAV "fish.payara.examples,test,1.0-SNAPSHOT" --additionalRepository https://maven.java.net/content/repositories/promoted/
```

To search through multiple additional repositories, you can simply call the option multiple times:

```Shell
java -jar payara-micro.jar --deployFromGAV "fish.payara.examples,test,1.0-SNAPSHOT" --additionalRepository https://maven.java.net/content/repositories/promoted/ --additionalRepository https://raw.github.com/payara/Payara_PatchedProjects/master/
```

## 4.2 Deploying Applications Programmatically
This section details deploying applications from within your code.

### 4.2.1 Deploying an Application Programmatically during Bootstrap
There are two methods you can use to deploy an application during the bootstrapping process: `addDeployment(String pathToWar)`, and `addDeploymentFile(File file)`.

The first, `addDeployment(String pathToWar)`, accepts a String that points to the path of the file to be deployed. For example:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().addDeployment("/home/user/example.war").bootStrap();
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

#### 4.2.1.1 Deploying Multiple Applications Programmatically during Bootstrap
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

### 4.2.2 Deploying an Application Programmatically to a Bootstrapped Instance
There are three methods available for deploying an application to a bootstrapped instance: `deploy(File war)`, `deploy(String name, InputStream is)`, and `deploy(String name, String contextRoot, InputStream is)`.

The first works in the same way as the `addDeploymentFile` method described in [section 4.2.1](#421-deploying-an-application-programmatically-during-bootstrap).

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File war = new File("/home/user/deployments/");
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        instance.deploy(war);
    }
}
```

The second method allows you to deplor WARs from an InputStream:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        
        try (InputStream is = new FileInputStream("/home/user/test.war"))
        {        
            instance.deploy("test", is);
        }
        
        catch (IOException ex)
        {
            Logger.getLogger(EmbeddedPayara.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
```

The third method works in the same way as the previous method, but allows you to specify the context root of the application. The following example would deploy the _test_ application to a context root of _/app_:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        
        try (InputStream is = new FileInputStream("/home/user/test.war"))
        {        
            instance.deploy("test", "app", is);
        }
        
        catch (IOException ex)
        {
            Logger.getLogger(EmbeddedPayara.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
```

As an alternative to using the methods above, you can use the `run(Collection<InstanceDescriptor> members, String command, String... args )` method to run the `deploy` asadmin command. To deploy to a single instance, you must create a _members_ Collection only containing a single instance.

As an example of deploying an application to only the local instance with the run command:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import fish.payara.micro.services.data.InstanceDescriptor;
import java.util.ArrayList;
import java.util.Collection;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime runtime = PayaraMicro.getInstance().setHttpAutoBind(true).bootstrap();
        
        // Get a Collection with all running instances in the local runtime's cluster
        Collection<InstanceDescriptor> allInstances = runtime.getClusteredPayaras();       
        
        // Create a Collection to use as a subset
        Collection<InstanceDescriptor> subset = new ArrayList<>();
        
        // Loop through all instances
        for (InstanceDescriptor instance : allInstances)
        {
            // Only add the local instance
            if (instance == runtime.getLocalDescriptor())
            {
                subset.add(instance);
                break;
            }
        }

        // Run the deploy asadmin command on the subset Collection
        runtime.run(subset, "deploy", "/home/user/test.war");
    }
}
```

### 4.2.2.1 Deploying an Application to Multiple Bootstrapped Instances Programmatically
As noted to in the [previous section](#422-deploying-an-application-programmatically-to-a-bootstrapped-instance), you can use the `run` method to run the `deploy` asadmin command on one or more clustered instances.
There are two _run_ methods available for running asadmin commands: one which runs an asadmin command on a subset of instances in a cluster, and another than runs an asadmin command on all instances in a cluster. More detail on these can be found in the [Running Asadmin Commands on Bootstrapped Instances](#10-running-asadmin-commands-on-bootstrapped-instances) section.

As an example of deploying an application to all instances in a cluster:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime runtime = PayaraMicro.getInstance().setHttpAutoBind(true).bootstrap();

        // Run the deploy asadmin command on all instances in the runtime's cluster
        runtime.run("deploy", "/home/user/test.war");
    }
}
```

See the [previous section](#422-deploying-an-application-programmatically-to-a-bootstrapped-instance) for an example on using the `run` method on a subset of instances in a cluster.

## 4.2.3 Deploying an Application Programmatically from a Maven Repository
To deploy an application Programmatically directly from a Maven repository, you will need to add a Maven GAV coordinate. This can be done using `addDeployFromGAV()` method. This method accepts a comma separated string denoting a maven artefact's _groupId_, _artifactId_, and _version_ attributes.

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
       PayaraMicro.getInstance().addDeployFromGAV("fish.payara.testing,clusterjsp,1.1").bootStrap();
    }
}
```

By default, Payara Micro will only search for artefacts in the Maven Central repository. If you wish to search additional repositories, you can add them to the list of repositories to search with the `addRepoUrl()` method:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
       PayaraMicro.getInstance().addRepoUrl("https://raw.github.com/Pandrex247/Payara_PatchedProjects/Payara-Maven-Deployer");
       PayaraMicro.getInstance().addDeployFromGAV("fish.payara.testing,clusterjsp,1.1").bootStrap();
    }
}
```

To search through multiple additional repositories, you can simply call the `addRepoUrl` method add URL of the repository separated by a comma :

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
       PayaraMicro micro = PayaraMicro.getInstance();
       micro.addRepoUrl("https://raw.github.com/Pandrex247/Payara_PatchedProjects/Payara-Maven-Deployer", "https://maven.java.net/content/repositories/promoted/");
       micro.addDeployFromGAV("fish.payara.testing,clusterjsp,1.1");
       micro.bootStrap();
    }
}
```

### 4.2.3.1 Deploying Multiple Applications from a Maven Repository
Similar to when deploying multiples applications from the command line, you must call the `addDeployFromGAV` method for each application you wish to deploy directly from a Maven repository.

For example, to deploy two applications:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
       PayaraMicro micro = PayaraMicro.getInstance();
       micro.addDeployFromGAV("fish.payara.testing,clusterjsp,1.1");
       micro.addDeployFromGAV("fish.payara.testing,clusterjsp,1.2");
       micro.bootStrap();
    }
}
```

# 4.3 Deploying an Exploded War

An exploded war can be deployed to a Payara Micro instance just be specifying the path to the exploded war root directory on the `--deploy` command line or via the api. The exploded war can be redeployed by creating a file .reload in the root directory of the explded war and updating its timestamp for example using 
`touch .reload` in LINUX.

# 5 Configuring an Instance
This section details how to configure a Payara Micro instance.

## 5.1 Configuring an Instance from the Command Line
As described in [section 4.1](#41-deploying-an-application-from-the-command-line), the starting and configuration of an instance has to be done in its entirety on one line.

The options available can be seen by running the JAR with the `--help` option, or by consulting the [Payara Micro Command Line Options](#131-payara-micro-command-line-options) section in the [Appendices](#13-appendices).

The general structure of starting, configuring, and deploying an application to an instance is as follows:

```Shell
java -jar payara-micro.jar _--option1_ _--option2_ ...
```

As an example, see below for starting an instance with a non-default HTTP port:

```Shell
java -jar payara-micro.jar --port 2468
```

### 5.1.1 Precedence
If specifying multiple options at once, the following precedence is followed:

_rootDir < domainConfig < autoBindHttp | autoBindSsl < port | sslPort_

In English: The domain.xml in the directory specified by the _rootDir_ option (if one exists) is overriden by the domain.xml specified with the _domainConfig_ option. The Http and Https port numbers specified in either of these domain.xml files are overidden to be the default values of 8080 and 8081 when the _autoBindHttp_ or _autoBindSsl_ options are enabled respectively. These default port values are then overriden in turn by the port numbers specified with the _port_ or _sslPort_ options.

## 5.2 Configuring an Instance Programmatically
There are various methods available for configuring a Payara Micro instance programmatically. You can only configure an instance before it is bootstrapped however.

The configuration methods available to you should be detected by your IDE, allowing you to view them using the auto-complete feature common to most popular IDEs. Alternatively, you can consult the [Payara Micro Configuration Methods](#1321-payara-micro-configuration-methods) section in the [Appendices](#13-appendices).

As noted before, in the [Deploying an Application Programmatically](#421-deploying-an-application-programmatically-during-bootstrap) section, you can either call the desired configuration commands on one line during instance initialisation, or on separate lines after creating a `PayaraMicro` variable.

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

It is also possible to configure an instance programmatically by specifying a domain.xml file that is packaged within your application by passing a resource string to the setApplicationDomainXML method. The path in the string will be rsolved using the getResource method of the Thread context class loader. 

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().setApplicationDomainXML("config/domain.xml").bootStrap();
    }
}
```

## 5.3 Packaging a Configured Instance as an Uber Jar
Sometimes it is preferable to package the application, configuration and dependencies into a single executable jar. To do this with Payara Micro use the `--outputUberJar` command line option for example;

```shell
java -jar payara-micro.jar --deploy test.war --outputUberJar test.jar
```

this will package up the payara-micro.jar and the war file into a single jar. this jar will then be able to be run with;

```shell
java -jar test.jar
```

Any additional command line options you specify when creating an uber jar are recorded and retained when you run the uber jar with no parameters. For example

```shell
java -jar payara-micro.jar --deploy test.war --port 9080 --lite --clusterName test-cluster --clusterPassword test-password --outputUberJar test2.jar
```

All the command line option for port etc. will be retained when the uber jar is ran with no parameters.

## 5.4 Configuring Payara Micro via System Properties

Payara Micro can also be configured via System properties. These can either be set on the command line or passed into Payara Micro using the `--systemProperties` command line option which will load the properties from the specified file.

Payara micro supports the following system properties.

System Property | Equivalent Command Line Flag
--- | ---
payaramicro.domainConfig |--domainConfig
payaramicro.hzConfigFile |--hzConfigFile 
payaramicro.autoBindHttp |--autoBindHttp
payaramicro.autoBindRange|--autoBindrange
payaramicro.autoBindSsl|--autoBindSsl
payaramicro.enableHealthCheck|--enableHealthCheck
payaramicro.port|--port
payaramicro.mcAddress|--mcAddress
payaramicro.mcPort|--mcPort
payaramicro.clusterName|--clusterName
payaramicro.clusterPassword|--clusterPassword
payaramicro.lite|--lite
payaramicro.maxHttpThreads|--maxHttpThreads
payaramicro.minHttpThreads|--minHttpThreads
payaramicro.noCluster|--noCluster
payaramicro.disablePhoneHome|--disablePhoneHome
payaramicro.rootDir|--rootDir
payaramicro.name|--name

## 5.5 Configuring Alternate Keystores for SSL
Payara Micro comes with keystores embedded within the jar file. These can be overridden using the standard Java SSL system properties. `javax.net.ssl.trustStore` etc.


# 6. Stopping an Instance
This section describes how to shut down a Payara Micro instance.

## 6.1 Stopping an Instance from the Command Line
There is no specific option for shutting down a Payara Micro instance.
The only way to shut down an instance from the command line is to find the process ID of the Payara Micro instance, and send a kill signal to it.

## 6.2 Stopping an Instance Programmatically
To shut down a Payara Micro instance programmatically, you will need to use the `shutdown()` method of the `PayaraMicro` or `PayaraMicroRuntime` class.

The `shutdown()` method of the `PayaraMicro` class must be called on the instance of Payara Micro that you want to shut down, so will realistically only be used on a `PayaraMicro` instance variable:

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

The `shutdown()` method of the `PayaraMicroRuntime` class is tied to an instance variable, so is used in much the same way:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();

        instance.shutdown();
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

If you wish to have multiple clusters, then you can make use of the `--mcAddress` and ``mcPort` options to define a different multicast address and port; assign a different address and port to each set of instances you wish to operate in a separate cluster and they will automatically make their own cluster on the new multicast address and port. You can also use `--clusterName` and `--clusterPassword` to segregate clusters. 

# 7.1 Lite Cluster Members

If you specify on the command line or through the API that a Payara Micro instance is a lite instance. Then the Payara Micro instance will join the cluster but will not store any clustered data, for example web session data or JCache data. This is very useful for a number of scenarios;

You can create a cluster topology whereby a web application is hosted in a number of payara micro instances and the garbage collection ergonomics for these instances are tuned for throughput, in addition a number of payara micro instances are also in the cluster with no applications deployed and these instances are tuned for long lived web session data. In this case the web application instances could be designated as lite cluster members to ensure no web session data is stored within their JVMs.

Lite members can also be used purely if you want a clustered payara micro instance to join the same cluster and receive CDI events or clustered events but without storing any data.

# 7.2 Preventing Cluster Cross Talk

By default Payara Micro clusters automatically discover other cluster members via multicast. This can lead to the situation whereby different development environments being used by different teams cluster together as they are using the same multicast address and multicast port. This can lead to confusing errors. To prevent cluster cross-talk ensure that the multicast-address and muticast-port are set to different values on each unique cluster. In the case where this is not possible payara micro provides the capability to set a cluster name and a cluster password both through the command line or through the api. If all the multicast settings are similar, instances will only cluster together if all the instances have the same cluster name and cluster password.

# 7.3 Clustering with Payara Server
Payara Micro can cluster with Payara Server and share web session and JCache data. To cluster with Payara Server just start up a Payara Micro instance with the same multicast address, multicast port, cluster name and cluster password as configured in your Payara Server.

# 8. Payara Micro and Maven
Payara Micro has been uploaded to Maven central, allowing you to include it as a dependency in your POM. This allows you to easily add the required Payara Micro classes and methods to your application to use Payara Micro programmatically.

In your project's POM, include the following dependency:

```MAVEN_POM
<dependency>
    <groupId>fish.payara.extras</groupId>
    <artifactId>payara-micro</artifactId>
    <version>4.1.1.162</version>
</dependency>
```

# 9. Payara Micro HTTP and HTTPS Auto-Binding
Payara Micro supports an auto-binding feature for its HTTP and HTTPS port, allowing Payara Micro to dynamically find a free HTTP or HTTPS port as required during startup.

This feature is controlled through these three options:  
* --autoBindHttp – Enables auto-bind functionality for the HTTP port  
* --autoBindSsl – Enables auto-bind functionality for the HTTPS port  
* --autoBindRange – Sets the range for the auto-bind feature  

When auto-binding is enabled, Payara Micro will attempt to connect to the port specified with the `--port` or `--sslPort` option (or, if these options are not specified, to port 8080 and 8181 respectively), and if that port is busy, it will instead try to bind on the next port up, repeating this process until it finds a free port, or the `--autoBindRange` limiter is reached.  

For example, if ports 8080, 8081, and 8181 were busy, and ports 8082 and 8182 were free, then starting Payara Micro with the following command would have the HTTP port bind to 8082 and the HTTPS port bind to 8182:

```Shell
java -jar payara-micro.jar --autoBindHttp --sslPort 8181 --autoBindSsl
```

Whereas the following would fail to start in the same situation because `--autoBindRange` is not large enough (no free port within the range of 8080-8081):

```Shell
java -jar payara-micro.jar --port 8080 --autoBindHttp --sslPort 8181 --autoBindSsl --autoBindRange 1
```

Be aware that the auto-bind feature does not currently read port values from domain.xml files; if the `--port` and `--sslPort` options are not used, then the `--autoBindHttp` and `--autoBindSsl` options will assume that the HTTP and HTTPS ports will be at the default values of 8080 and 8181 respectively.

# 10. Running Asadmin Commands on Bootstrapped Instances
There are two methods available for running asadmin commands, both named `run`.

The first, `run(String command, String... args )`, runs the specified asadmin command on all instances in a runtime's cluster. It returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, as detailed in the [appendices](#13224-run-methods).

The second, `run(Collection<InstanceDescriptor> members, String command, String... args )`, runs the specified asadmin commond on all instances contained in the Collection supplied. It returns a Map of the same type as the other run method. You can use the 

Examples on using the first and second methods can be seen in sections [4.2.2](#422-deploying-an-application-programmatically-to-a-bootstrapped-instance) and [4.2.2.1](#4221-deploying-an-application-to multiple-bootstrapped-instances-programmatically) respectively. The first example shows one way in which you can construct a Collection containing a subset of the running instances in a cluster using the `getClusteredPayara()` method to get the _InstanceDescriptor_ identifiers.

# 11. Running Callable Objects on Bootstrapped Instances
Like with running asadmin commands, there are two methods available for running Callable objects, both also named `run`.

The two methods also work in a similar way to the two asadmin run methods: the first, `run(Callable<T> callable)`, runs the specified Callable on all instances in a runtime's cluster, and the second, `run(Collection<InstanceDescriptor> members, Callable<T> callable)`, runs the Callable on a subset of the instances in a runtime's cluster.
Both return a Map with a key/value type of `<InstanceDescriptor, Future<T>>`, where the type variable _T_ is Serializable.

# 12. Firing and Listening for CDI Events
Payara Micro has the ability to listen for and fire CDI events across the cluster of a PayaraMicroRuntime instance.

You can view the methods associated with CDI Events in the [appendices](#13223-cdi-methods).

# 13. Appendices

## 13.1 Payara Micro Command Line Options

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
`--help` | Displays the configuration options and then exits. | If not set, this option is not used.

## 13.2 Payara Micro API
This section contains documentation on the Payara Micro API.

### 13.2.1 Configuration Methods
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

### 13.2.2 Operation Methods
This section details the other methods of the Payara Micro API that operate Payara Micro instances. `PayaraMicro.class` methods are used during the bootstrap process, whereas `PayaraMicroRuntime.class` methods are used on running instances.

#### 13.2.2.1 Deployment Methods
This section details the methods used for the deployment of applications to Payara Micro instances.

##### 13.2.2.1.1 PayaraMicro.class Methods
Method | Description | Command Line Equivalent
--- | --- | --- | ---
`PayaraMicro addDeployment(String pathToWar)` | Adds the file found at the location of the `pathToWar` parameter to the list of files to be deployed upon starting the instance. | `--deploy`
`PayaraMicro addDeploymentFile(File file)` | Adds the file associated with the `file` parameter to the list of files to be deployed upon starting the instance. | `--deploy`

##### 13.2.2.1.2 PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`boolean deploy(String name, InputStream is)` | Deploys an application from an InputStream with the name specified.
`boolean deploy(String name, String contextRoot, InputStream is)` | Deploys an application from an InputStream, with the specified name and context root.
`boolean deploy(File war)` | Deploys the application located at the _war_ parameter path.
`boolean undeploy(String name)` | Un-deploys the specified application.

#### 13.2.2.2 Setup and Shutdown Methods
This section details the methods required for setting up Payara Micro instances.

##### 13.2.2.2.1 PayaraMicro.class Methods
Method | Description
--- | ---
`PayaraMicroRuntime bootStrap() throws BootstrapException` | Checks the supplied configuration parameters and starts a Payara Micro instance.
`PayaraMicro getInstance()` | Obtains the static singleton instance of the Payara Micro server. If one does not exist, one will be created and returned.
`PayaraMicro getInstance(boolean create)` | Obtains the static singleton instance of the Payara Micro server. If one does not exist and `create` is set to true, one will be created and returned, otherwise returns _null_.
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

##### 13.2.2.2.2 PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

#### 13.2.2.3 CDI Methods
This section details the methods used for firing CDI Events across running instances.

Method | Description
--- | ---
`void addCDIEventListener(CDIEventListener listener)` | Adds a CDI Event Listener.
`void removeCDIEventListener(CDIEventListener listener)` | Removes a CDI Event Listener.
`void addClusterListener(PayaraClusterListener listener)` | Adds a Cluster Listener.
`void removeClusterListener(PayaraClusterListener listener)` | Removes a Cluster Listener.
`void publishCDIEvent(PayaraClusteredCDIEvent event)` | Publishes a CDI Event.

#### 13.2.2.4 Run Methods
This section details the methods used for running _asadmin_ commands or _Callable_ objects on bootstrapped instances.

Method | Description
--- | ---
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (String command, String... args )` | Runs an asadmin command on all members of a Payara Micro Cluster.
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (Collection<InstanceDescriptor> members, String command, String... args )` | Runs an asadmin command on specified members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Callable<T> callable)` | Runs a Callable object on all members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Collection<InstanceDescriptor> members, Callable<T> callable)` | Runs a Callable object on specified members of a Payara Micro Cluster.

#### 13.2.2.5 Get Methods
This section details the methods used for getting information on running Payara Micro instances. For information on the _Get_ methods of an un-bootstrapped instance, see the [Configuration Methods section](#1321-configuration-methods).

Method | Description
--- | ---
`Collection<InstanceDescriptor> getClusteredPayaras()` | Returns a collection of instance descriptors for all the Payara Micros instances in a cluster.
`Collection<String> getDeployedApplicationNames()` | Returns the names of the deployed applications.
`String getInstanceName()` | Returns the instance name.
`InstanceDescriptor getLocalDescriptor()` | Returns the instance descriptor of the instance the method is run on.

### 13.2.3 Javadoc

The Javadoc for the most recent version of the Payara Micro API can be found here: http://payara.github.io/Payara/nucleus_API/payara-modules/payara-micro/target/apidocs/
