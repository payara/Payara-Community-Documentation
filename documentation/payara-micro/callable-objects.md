# Running Callable Objects on Bootstrapped Instances
Like with running asadmin commands, there are two methods available for running Callable objects, both also named `run`.

The two methods also work in a similar way to the two asadmin run methods: the first, `run(Callable<T> callable)`, runs the specified Callable on all instances in a runtime's cluster, and the second, `run(Collection<InstanceDescriptor> members, Callable<T> callable)`, runs the Callable on a subset of the instances in a runtime's cluster.
Both return a Map with a key/value type of `<InstanceDescriptor, Future<T>>`, where the type variable _T_ is Serializable.

