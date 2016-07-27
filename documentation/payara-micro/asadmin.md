# Running asadmin Commands on Bootstrapped Instances
There are two methods available for running asadmin commands, both named `run`.

The first, `run(String command, String... args )`, runs the specified asadmin command on all instances in a runtime's cluster. 
It returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, as detailed in the [appendices](appendices/operation-methods.md#run-methods).

The second, `run(Collection<InstanceDescriptor> members, String command, String... args )`, runs the specified asadmin command 
on all instances contained in the Collection supplied. It returns a Map of the same type as the other run method. You can use the method `getClusteredPayaras()` 
provided by `PayaraMicroRuntime` to retrieve the list of all instances in the cluster and filter the list afterwards.

Examples on using the first and second methods can be seen in section [Deploying Applications Using an asadmin Command](deploying/deploy-program-asadmin.md). 
The first example shows one way in which you can construct a Collection containing a subset of the running instances in a cluster using the `getClusteredPayara()` method to get the _InstanceDescriptor_ identifiers.
