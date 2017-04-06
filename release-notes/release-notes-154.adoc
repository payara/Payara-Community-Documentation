# Release Highlights
This release brings us back in line with GlassFish 4.1.1, with the benefit of all our additional fixes and enhancements from our previous releases, as well as a few more. Of particular interest in this release:

* Up to date with GlassFish 4.1.1.
* Removal of the dependency on .NET Framework 3.5, allowing Payara to be used with .NET Framework 4.
* The _payaradomain_ domain will now use an embedded Derby database for its default datasources (_domain1_ is unchanged to retain drop-in replacement viability).
* You can now set DISABLED as a JMS Broker type, allowing you to disable the OpenMQ Broker.
* Setting size-based log rotation to 0 will now turn it off.

In line with our [naming strategy](https://github.com/payara/Payara/wiki/General-Info#naming-strategy), our version number has also been extended for this release to reflect the fact that we are up to date with GlassFish 4.1.1.

# Updated Modules
This section details the modules that have been updated since the last release (4.1.153).

* Mojarra 2.2.12
* Webservices 2.3.2-b608
* JAXB 2.2.12-b141219.1637
* JAXB-API 2.2.13-b141020.1521
* Weld 2.2.16.Final
* Tyrus 1.11
* JBatch 1.0.1-b09
* Grizzly 2.3.23
* HK2 2.4.0-b32
* Jersey 2.22
* Hazelcast 3.5.2

# Enhancements
This section details the issues marked as enhancements that have been implemented for this release.

* [414/PAYARA-389 - Disable size based log rotation when set to zero](https://github.com/payara/Payara/issues/414)
* [421/PAYARA-447 – Add some simple asadmin commands](https://github.com/payara/Payara/pull/421)
* [425 - Make Instance Descriptor null safe when zero applications deployed](https://github.com/payara/Payara/pull/425)
* [429/PAYARA-387 - Make the default DerbyPool use Derby Embedded](https://github.com/payara/Payara/issues/429)
* [439/PAYARA-427 - Allow DISABLED as a JMS Broker type.](https://github.com/payara/Payara/pull/439)
* [440 - Allow MDB to specify the resource adapter to use in the Activation Config](https://github.com/payara/Payara/issues/440)
* [457/PAYARA-409 – Remove Update Center](https://jira.c2b2.co.uk/browse/PAYARA-409)
* [463/PAYARA-369 - Payara product names are not correct in the console. Should be Payara Server](https://github.com/payara/Payara/pull/463)
* [467/PAYARA-457 - classloader work](https://github.com/payara/Payara/pull/467)
* [475/PAYARA-347 - Converter autoApply does not work for primitive types](https://github.com/payara/Payara/issues/475)
* [479/PAYARA-453 - Windows service wrapper depends on .NET Framework 3.5](https://jira.c2b2.co.uk/browse/PAYARA-453)

# Fixed Issues
This section details the issues marked as bugs that have been fixed for this release.

### Payara Fixes
This section details the fixes implemented by the Payara team or community.

* [270 - Support rolling updates](https://github.com/payara/Payara/issues/270)
* [300 - Bean identifier index inconsistency after Hot re-deployment from NetBeans](https://github.com/payara/Payara/issues/300)
* [327 - Tyrus send partial message more than buffer size will cause exception in catalina OutputBuffer](https://github.com/payara/Payara/issues/327)
* [350 - Using AJP when downloading of large streaming data results in the errors "OutOfMemoryError: Java heap space" and "503 Service Temporarily Unavailable"](https://github.com/payara/Payara/issues/350)
* [371 - Creating an HTTP listener with security enabled using web admin console doesn't work](https://github.com/payara/Payara/issues/371)
* [377 - JAX-RS integration with EJB Technology doesn't work](https://github.com/payara/Payara/issues/377)
* [385/PAYARA-444/GLASSFISH-21371 - Alternate descriptors not persisted in remote deployments](https://github.com/payara/Payara/issues/385)
* [395 - IllegalArgumentException when starting a payara micro on Windows via cli with --rootDir or --domainConfig](https://github.com/payara/Payara/issues/395)
* [409/PAYARA-266 - Unable to add or remove java debug option using asadmin](https://github.com/payara/Payara/issues/409)
* [410/PAYARA-349 - Batch configuration requires data source on DAS](https://github.com/payara/Payara/issues/410)
* [411/PAYARA-372 - JMS broker issues when broker port is already in use](https://github.com/payara/Payara/issues/411)
* [412/PAYARA-373 - REST interface to create auth-realm fails](https://github.com/payara/Payara/issues/412)
* [415/PAYARA-405 – It is possible to set invalid ejb container thread pool settings](https://github.com/payara/Payara/issues/415)
* [418/PAYARA-415 - Can not inject PayaraMicroRuntime CDI bean when deploying a war on the PayaraMicro command line](https://github.com/payara/Payara/pull/418)
* [420 - Changed the way to load payara-bootstrap.properties.](https://github.com/payara/Payara/pull/420)
* [423 - Payara Micro name not passed through to the instance descriptor](https://github.com/payara/Payara/issues/423)
* [427/PAYARA-322 - enable-secure-admin-principal adds principal multiple times](https://github.com/payara/Payara/issues/427)
* [433/PAYARA-452 - Clustered / Versioned applications cannot be enabled on individual cluster instances](https://github.com/payara/Payara/issues/433)
* [458/PAYARA-466 - File deleted after successfuly deployed with web gui local file dialog](https://github.com/payara/Payara/issues/458)
* [460/PAYARA-459 - ${com.sun.aas.hostName} not resolved correctly in JVM options](https://github.com/payara/Payara/issues/460)
* [465/PAYARA-448 - Could not load class javax.rmi.CORBA.EnumDesc](https://github.com/payara/Payara/issues/465)
* [472/PAYARA-454 - NPE thrown by JMS Ping if no Default JMS Host is configured on the DAS](https://github.com/payara/Payara/issues/472)
* [485/PAYARA-388 - Server log displays webappClassLoader severe warnings on shutdown](https://github.com/payara/Payara/pull/485)
* [PAYARA-370 - Fixes confusing typo in the admin console](https://github.com/payara/Payara/pull/390)
* [GLASSFISH-21007 - HTTP Upgrade handler init called twice when access log is turned on](https://java.net/jira/browse/GLASSFISH-21007)

### Upstream Fixes
This section details the fixes brought in from the GlassFish upstream.
* [GLASSFISH-21009 - The behavior of --timeout-seconds is not in line with the document](https://java.net/jira/browse/GLASSFISH-21009)
* [GLASSFISH-21172 - javax.transaction.RollbackException from @Transactional bean has no cause set](https://java.net/jira/browse/GLASSFISH-21172)
* [GLASSFISH-21381 - war with web service not deploying correctly](https://java.net/jira/browse/GLASSFISH-21381)
* [GLASSFISH-21391 - Disable SSLv3 by default in config module](https://java.net/jira/browse/GLASSFISH-21391)
* [GLASSFISH-21426 - Application deployment fails when DataSourceDefinition annotation is used within an EJB inside a war.](https://java.net/jira/browse/GLASSFISH-21426)
* [fix enforcer version of the javadoc-jdk8+ profile activation](https://github.com/Pandrex247/Payara/commit/87b5e56f5584743568a40c546d9b7353cd8213e5)
* [fixed redundant null check caught by findbugs for an earlier commit](https://github.com/Pandrex247/Payara/commit/9d4b676aecf61ab2e3e4e5716400919f993c1465)
* [In case of JDK 9, java.logging loading sun.util.logging.resources.logging resource bundle and java.logging module is used as the cache key with null class loader.So we are adding a null check](https://github.com/Pandrex247/Payara/commit/fe015d0fc30ce59a54d37d1c8c51f7b71d8ff023)
* [As per servlet spec 3.1, when Request.setCharacterEncoding(String enc) is called, the call should be a no-op if request input parameters have already been read or if getReader() has been called. However, at present, check is there only in case of use of reader and no check if parameter has been read by a different method call (e.g by calling getParameter()). This seems to be a regression introduced during Grizzly 2.0 integration in revision 46674. Changes have been made to check if parameters have been processed/read too. character encoding will not be set if either parameters have been reader or reader is being used.](https://github.com/Pandrex247/Payara/commit/c1f008d2a8596e96fa53e8b7286dd6250ec59b87)
* [EjbDescriptor abstract class implements JndiNameEnvironment and WritableJndiNameEnvironment. For some of these methods, though there is a generic implementation (For example via CommonResourceDescriptor), these methods still needs to be implemented in a specific way within EjbDescriptor abstract class to get the expected behavior whenever these methods are invoked in EjbDescriptor's context. To ensure the same, a new unit test is being introduced within source workspace, namely EjbDescriptorInheritedMethodImplementationTest,which basically ensures following two things: All methods defined in JndiNameEnvironment and WritableJndiNameEnvironment have a direct implementation within EjbDescriptor abstract class and all these methods are marked final in EjbDescriptor to ensure that sub-classes of EjbDescriptor don't override these methods accidentally, possibly causing unexpected behavior.](https://github.com/Pandrex247/Payara/commit/46bba102abd3749ae3c0d742119ffe442790819b)
* [fix web container issue filed in Grizzly](https://github.com/Pandrex247/Payara/commit/3d1d0fc0fbe5ea6088dc313cdcd0eb31d9300f79)

# Known Issues
Known issues can be seen on our GitHub issues page here: https://github.com/payara/Payara/issues