# Configuring Payara Micro via System Properties

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
payaramicro.logToFile|--logToFile
