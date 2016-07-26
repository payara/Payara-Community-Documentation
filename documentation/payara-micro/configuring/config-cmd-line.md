# Configuring an Instance from the Command Line
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

## Precedence
If specifying multiple options at once, the following precedence is followed:

_rootDir < domainConfig < autoBindHttp | autoBindSsl < port | sslPort_

In English: The domain.xml in the directory specified by the _rootDir_ option (if one exists) is overriden by the domain.xml specified with the _domainConfig_ option. The Http and Https port numbers specified in either of these domain.xml files are overidden to be the default values of 8080 and 8081 when the _autoBindHttp_ or _autoBindSsl_ options are enabled respectively. These default port values are then overriden in turn by the port numbers specified with the _port_ or _sslPort_ options.