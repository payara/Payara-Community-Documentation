# Payara Micro Command Line Options

All of the options listed below are case-insensitive from version `4.1.1.171`; prior versions need the option to be set with [camelCase](https://en.wikipedia.org/wiki/Camel_case) (with an initial lower-case letter)

Configuration Option | Description | Default Value
--- | --- | ---
`--nocluster` | Disables clustering for this instance. | _false_
`--deploymentdir`<br />`--deploydir` | Sets a directory which will be scanned for WAR files for auto-deployment. | If not set, has no value and is not used.
`--deploy <file-path>` | Specifies a WAR file to deploy | If not set, has no value and is not used.
`--port` | Sets the HTTP port that the instance will bind to. | 8080
`--sslport` | Sets the HTTPs port that the instance will bind to. | If not set, has no value and HTTPS is disabled.
`--name` | Sets the instance name. | Generated Universally Unique Identifier.
`--instancegroup` <br /> `--group` | Sets the instance group |
`--mcaddress` | Sets the cluster multicast group for the instance. | 224.2.2.4
`--mcport` | Sets the cluster multicast port. | 2904
`--clustername`| Sets the cluster group name |
`--clusterpassword` | Sets the cluster group password |
`--hostaware` | Enable Host Aware Partitioning. When enabled cluster backups will not be stored on members with the same IP Address | 
`--startport` | Sets the cluster start port number. | 5900
`--rootdir` | Sets the root configuration directory and saves the configuration across restarts. | If not set, has no value and defaults to the temp directory.
`--domainconfig` | Overrides the server configuration with an alternative domain.xml file. | If not set, the domain.xml contained in the Payara Micro JAR is used.
`--minhttpthreads` | Sets the minimum number of threads in the HTTP thread pool. | 10
`--maxhttpthreads` | Sets the maximum number of threads in the HTTP thread pool. | 10
`--hzconfigfile` | Sets the Hazelcast configuration file to use for overriding the in-built Hazelcast cluster configuration. | if not set, the in-built Hazelcast configuration file is used.
`--autobindhttp` | Enables auto-binding for the HTTP port | _false_
`--autobindssl` | Enables auto-binding for the HTTPS port | _false_
`--autobindrange` | Sets the range for HTTP and HTTPS port auto-binding. | 5
`--lite` | sets the micro container to lite mode which means it clusters with other Payara Micro instances but does not store clustered data |
`--enablehealthcheck <boolean>` | enables/disables Health Check Service | disabled
`--logo` | Reveals the #BadAssFish or a custom logo on boot |
`--deployfromgav <list-of-artefacts>` | specifies a comma separated groupId,artifactId,versionNumber of an artefact to deploy from a repository |
`--additionalrepository <repo-url>` | specifies an additional repository to search for deployable artefacts in |
`--outputuberjar` |  packages up an uber jar at the specified path based on the command line arguments and exits |
`--systemproperties` | Reads system properties from a file |
`--disablephonehome` | Disables _Phone Home_ activities for this instance | If not set, _Phone Home_ is active |
`--version` | Displays the version information |
`--logtofile <file-path>` | outputs all the Log entries to a user defined file |
`--logproperties <file-path>` | Allows user to set their own logging properties file |
`--accesslog <directory-path>` | Sets user defined directory path for the access log |
`--accesslogformat` | Sets user defined log format for the access log |
`--enablerequesttracing` | Enables the Request Tracing Service and optionally sets the threshold unit and/or value | 
`--requesttracingthresholdunit` | Sets the time unit for the requestTracingThresholdValue option |
`--requesttracingthresholdvalue` | Sets the threshold time before a request is traced |
`--prebootcommandfile` | Provides a file of asadmin commands to run before booting the server |
`--postbootcommandfile` | Provides a file of asadmin commands to run after booting the server |
`--nested` | Do not unpack the Nested Jars when booting the server. This is generally slower than unpacking the runtime. |
`--unpackdir` | Unpack the Nested Jar runtime jars to the specified directory. | The default behaviour is to unpack to java.io.tmpdir |
`--help` | Displays the configuration options and then exits. | If not set, this option is not used.

