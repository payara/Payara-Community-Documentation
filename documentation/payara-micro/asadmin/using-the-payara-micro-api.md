# Running Asadmin Commands on Bootstrapped Instances using the API

It is possible to execute administration commands programmatically using the [Payara Micro API](/documentation/payara-micro/appendices/micro-api.md). There are two methods available to do this, both named `run`.

The first, `run(String command, String... args )`, runs the specified _asadmin_ command on all instances in the runtime's cluster. It returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, which can be used to inspect the results of the execution on each instance the command was executed.

The second, `run(Collection<InstanceDescriptor> members, String command, String... args )`, runs the specified _asadmin_ command on all instances contained in the `Collection` supplied. As with the previous method, it returns a `Map<InstanceDescriptor, Future<ClusterCommandResult>>`, which can be used to inspect the results of the command execution. 

For both methods, it's recommended to use the method `getClusteredPayaras()` provided by `PayaraMicroRuntime` to retrieve the list of all instances in the cluster an determine which command executions are filtered.

Examples of using the first and second methods can be seen in section [Deploying Applications Using an asadmin Command](deploying/deploy-program-asadmin.md).

The first example shows one way in which you can construct a Collection containing a subset of the running instances in a cluster using the `getClusteredPayara()` method to get the _InstanceDescriptor_ identifiers.

