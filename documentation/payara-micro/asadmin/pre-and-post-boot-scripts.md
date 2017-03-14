# Running asadmin commands using Preboot and Posboot Scripts

Starting from Payara Micro 4.1.1.171, asadmin commands can also be run against a Payara Micro instance at specific moments in it's lifecycle. It's possible to run configuration commands before and after the image has started. To do this, you must provide the commands you wish to execute in special scripts.

## Structure of a Boot Script

Boot scripts are simple text files that contain the asadmin commands/subcommands used to configure the instance. These scripts will follow the next set of rules:

1. Each asadmin command must be represented in one line of text in the script. No line breaks are allowed. 
2. Each asadmin command must be formatted on the syntax `subcommand `_`[options] [operands]`_, as if you would run the commands on a multimode session from the command line.
3. Empty lines and comment lines \(starting with the `#` character\) are ignored.

Here's a sample of a post boot script used to configure an instance for production uses:

```
#Disable dynamic reloading of applications
set configs.config.server-config.admin-service.das-config.dynamic-reload-enabled=false
#Disable auto deployment
set configs.config.server-config.admin-service.das-config.autodeploy-enabled=false

#Optimizing Heap size
delete-jvm-options -client:Xmx1024:-Xms512
create-jvm-options -server:-Xmx2048:-Xms2048

#Configuring Hazelcast cluster
set-hazelcast-configuration --clusterName=my-production-cluster --target=server-config
```

## Configuring Boot Scripts

There are multiple ways to configure a Micro instance to use boot scripts.

### Configuring Boot Scripts from the command line

When running a Payara Micro from the command line, use the `--prebootcommandfile` and `--postbootcommandfile` options to specify the script file locations like this:

```
java -jar payara-micro.jar --prebootcommandfile prepare-resources.txt --postbootcommandfile ready-production-use.txt
```









 



