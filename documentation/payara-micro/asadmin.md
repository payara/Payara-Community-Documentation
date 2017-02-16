# Running asadmin Commands on Micro from a Domain Administration Server
Asadmin commands can be sent from the Domain Administration Server (DAS) to micro instances that are running within the same cluster as the DAS server. This can be achieved either using the admin console or using asadmin commands.

## Sending asadmin Commands using the Admin Console
To send asadmin commands using the Domain Administration Server you must first ensure that the DAS itself is within the same Hazelcast cluster as the micro instances.

Going to the "Domain" tab on the admin console, then Hazelcast brings up the instances within the cluster. At the bottom of the page, you will find a table filled with the Payara Micro instances. To send an asadmin command, select the nodes you wish to receive the command then type in the asadmin command in the toolbar at the top of the table, before clicking send.

## Sending asadmin Commands Using the Command Line
To send asadmin commands using the command line there is a new asadmin command for the Domain Administation Server - `send-asadmin-command`.

The asadmin command is entered using the `--command` option, which only accepts a single input.

As an example of sending a command via asadmin:

```Shell
asadmin send-asadmin-command --command deploy /home/user/application --contextRoot=/example
```

# Running asadmin Commands on Bootstrapped Instances
There are two methods available for running asadmin commands, both named `run`.

The first, `run(String command, String... args )`, runs the specified asadmin command on all instances in a runtime's cluster.
It returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, as detailed in the [appendices](appendices/operation-methods.md#run-methods).

The second, `run(Collection<InstanceDescriptor> members, String command, String... args )`, runs the specified asadmin command
on all instances contained in the Collection supplied. It returns a Map of the same type as the other run method. You can use the method `getClusteredPayaras()`
provided by `PayaraMicroRuntime` to retrieve the list of all instances in the cluster and filter the list afterwards.

Examples of using the first and second methods can be seen in section [Deploying Applications Using an asadmin Command](deploying/deploy-program-asadmin.md).
The first example shows one way in which you can construct a Collection containing a subset of the running instances in a cluster using the `getClusteredPayara()` method to get the _InstanceDescriptor_ identifiers.
