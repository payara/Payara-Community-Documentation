# Running Asadmin Commands on Bootstrapped Instances
There are two methods available for running asadmin commands, both named `run`.

The first, `run(String command, String... args )`, runs the specified asadmin command on all instances in a runtime's cluster. It returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, as detailed in the [appendices](#13224-run-methods).

The second, `run(Collection<InstanceDescriptor> members, String command, String... args )`, runs the specified asadmin commond on all instances contained in the Collection supplied. It returns a Map of the same type as the other run method. You can use the 

Examples on using the first and second methods can be seen in sections [4.2.2](#422-deploying-an-application-programmatically-to-a-bootstrapped-instance) and [4.2.2.1](#4221-deploying-an-application-to multiple-bootstrapped-instances-programmatically) respectively. The first example shows one way in which you can construct a Collection containing a subset of the running instances in a cluster using the `getClusteredPayara()` method to get the _InstanceDescriptor_ identifiers.
