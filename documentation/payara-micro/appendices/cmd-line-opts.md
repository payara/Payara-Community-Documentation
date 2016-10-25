# Payara Micro Command Line Options

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
`--deploymentDir`<br />`--deployDir` | Sets a directory which will be scanned for WAR files for auto-deployment. | If not set, has no value and is not used.
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

