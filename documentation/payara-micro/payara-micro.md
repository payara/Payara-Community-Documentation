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
This page shall cover how to use Payara Micro.  

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

See [Payara Micro Appendices](appendices/appendices.md)
