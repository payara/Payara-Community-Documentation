# Operation Methods
This section details the other methods of the Payara Micro API that operate Payara Micro instances. 
`PayaraMicro.class` methods are used during the bootstrap process, whereas `PayaraMicroRuntime.class` methods are used on running instances.

The list of methods in the API:

   * [Deployment Methods](#deployment-methods)
   * [Setup and Shutdown Methods](#setup-and-shutdown-methods)
   * [CDI Methods](#cdi-methods)
   * [Run Methods](#run-methods)
   * [Get Methods](#get-methods)

## Deployment Methods
Deployment methods are used for the deployment of applications to Payara Micro instances.

### PayaraMicro.class Methods
Method | Description | Command Line Equivalent
--- | --- | --- | ---
`PayaraMicro addDeployment(String pathToWar)` | Adds the file found at the location of the `pathToWar` parameter to the list of files to be deployed upon starting the instance. | `--deploy`
`PayaraMicro addDeploymentFile(File file)` | Adds the file associated with the `file` parameter to the list of files to be deployed upon starting the instance. | `--deploy`

### PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`boolean deploy(String name, InputStream is)` | Deploys an application from an InputStream with the name specified.
`boolean deploy(String name, String contextRoot, InputStream is)` | Deploys an application from an InputStream, with the specified name and context root.
`boolean deploy(File war)` | Deploys the application located at the _war_ parameter path.
`boolean undeploy(String name)` | Un-deploys the specified application.

## Setup and Shutdown Methods
These methods are required for setting up Payara Micro instances.

### PayaraMicro.class Methods
Method | Description
--- | ---
`PayaraMicroRuntime bootStrap() throws BootstrapException` | Checks the supplied configuration parameters and starts a Payara Micro instance.
`PayaraMicro getInstance()` | Obtains the static singleton instance of the Payara Micro server. If one does not exist, one will be created and returned.
`PayaraMicro getInstance(boolean create)` | Obtains the static singleton instance of the Payara Micro server. If one does not exist and `create` is set to true, one will be created and returned, otherwise returns _null_.
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

### PayaraMicroRuntime.class Methods
Method | Description
--- | ---
`void shutdown() throws BootstrapException` | Stops and shuts down the Payara Micro instance.

## CDI Methods
These methods are used for firing CDI Events across running instances.

Method | Description
--- | ---
`void addCDIEventListener(CDIEventListener listener)` | Adds a CDI Event Listener.
`void removeCDIEventListener(CDIEventListener listener)` | Removes a CDI Event Listener.
`void addClusterListener(PayaraClusterListener listener)` | Adds a Cluster Listener.
`void removeClusterListener(PayaraClusterListener listener)` | Removes a Cluster Listener.
`void publishCDIEvent(PayaraClusteredCDIEvent event)` | Publishes a CDI Event.

## Run Methods
These methods are used for running _asadmin_ commands or _Callable_ objects on bootstrapped instances.

Method | Description
--- | ---
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (String command, String... args )` | Runs an asadmin command on all members of a Payara Micro Cluster.
`Map<InstanceDescriptor, Future<ClusterCommandResult>> run (Collection<InstanceDescriptor> members, String command, String... args )` | Runs an asadmin command on specified members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Callable<T> callable)` | Runs a Callable object on all members of a Payara Micro Cluster.
`<T extends Serializable> Map<InstanceDescriptor, Future<T>> run (Collection<InstanceDescriptor> members, Callable<T> callable)` | Runs a Callable object on specified members of a Payara Micro Cluster.

## Get Methods
These methods are used for getting information on running Payara Micro instances. 
For information on the _Get_ methods of an un-bootstrapped instance, see the [Configuration Methods section](#1321-configuration-methods).

Method | Description
--- | ---
`Collection<InstanceDescriptor> getClusteredPayaras()` | Returns a collection of instance descriptors for all the Payara Micros instances in a cluster.
`Collection<String> getDeployedApplicationNames()` | Returns the names of the deployed applications.
`String getInstanceName()` | Returns the instance name.
`InstanceDescriptor getLocalDescriptor()` | Returns the instance descriptor of the instance the method is run on.

