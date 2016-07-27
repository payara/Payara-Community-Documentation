# Deploying Applications Using an asadmin Command

## Deploying on a Local Instance
As an alternative to using the `deploy` methods above, you can use the `run(Collection<InstanceDescriptor> members, String command, String... args )` method to run the `deploy` asadmin command. To deploy to a single instance, you must create a _members_ Collection only containing a single instance.

As an example of deploying an application to only the local instance with the run command:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import fish.payara.micro.services.data.InstanceDescriptor;
import java.util.ArrayList;
import java.util.Collection;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime runtime = PayaraMicro.getInstance().setHttpAutoBind(true).bootstrap();
        
        // Get a Collection with all running instances in the local runtime's cluster
        Collection<InstanceDescriptor> allInstances = runtime.getClusteredPayaras();       
        
        // Create a Collection to use as a subset
        Collection<InstanceDescriptor> subset = new ArrayList<>();
        
        // Loop through all instances
        for (InstanceDescriptor instance : allInstances)
        {
            // Only add the local instance
            if (instance == runtime.getLocalDescriptor())
            {
                subset.add(instance);
                break;
            }
        }

        // Run the deploy asadmin command on the subset Collection
        runtime.run(subset, "deploy", "/home/user/test.war");
    }
}
```

## Deploying an Application to Multiple Bootstrapped Instances
You can use the `run` method to run the `deploy` asadmin command on multiple clustered instances.
There are two _run_ methods available for running asadmin commands: one which runs an asadmin command on a subset of instances in a cluster, and another than runs an asadmin command on all instances in a cluster. 
More detail on these can be found in the [Running Asadmin Commands on Bootstrapped Instances](../asadmin.md) section.

As an example of deploying an application to all instances in a cluster:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime runtime = PayaraMicro.getInstance().setHttpAutoBind(true).bootstrap();

        // Run the deploy asadmin command on all instances in the runtime's cluster
        runtime.run("deploy", "/home/user/test.war");
    }
}
```

See the example for deploying on local instance on using the `run` method on a subset of instances in a cluster.

