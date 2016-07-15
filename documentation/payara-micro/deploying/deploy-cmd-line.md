# Deploying an Application from the Command Line
As noted in section [Starting an Instance](../starting-instance.md#starting-an-instance-from-the-command-line), all Payara Micro actions are run for the Payara Micro JAR, all in one command; it is not possible to start an instance with one command, and deploy an application to it with another.

The general structure of starting, configuring, and deploying an application to an instance is as follows:

```Shell
java -jar payara-micro.jar _--option1_ _--option2_ ...
```

To deploy a WAR file to an instance, you need to use the `--deploy` option, followed by the path to the application to deploy. 
See below for an example of starting a Payara Micro instance and deploying a WAR file:

```Shell
java -jar payara-micro.jar --deploy /home/user/example.war
```

## Deploying Multiple Applications from the Command Line
If you want to deploy multiple applications to an instance with the ``--deploy` option, you must use it once for each application to be deployed; it does not accept multiple paths.

For example, to deploy two applications:

```Shell
java -jar payara-micro.jar --deploy /home/user/example.war --deploy /home/user/test.war
```

Alternatively, you can use the `--deploymentDir` option. This option specifies a directory to scan for deployable archives, allowing you to store all of the applications you wish to be deployed in a directory, and have them be deployed automatically upon instance startup.

```Shell
java -jar payara-micro.jar --deploymentDir /home/user/deployments
```

## Deploying Applications from a Maven repository
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