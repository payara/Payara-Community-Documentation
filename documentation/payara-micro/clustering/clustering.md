# Automatic Clustering
This section details how the Payara Micro automatic clustering works.

The integration of Hazelcast into Payara Micro allows instances to automatically, and dynamically, cluster together. When two instances are pointed at the same multicast address and port, they will automatically cluster together. 

You can see evidence of the automatic clustering by simply starting two instances (with different HTTP port configurations), and you should see the following in the log output:

```
Members [2] {
        Member [192.168.174.130]:5900 this
        Member [192.168.174.130]:5901
```

The `--startPort` option is used to determine which port the Payara Micro instance will **first** try to bind to, if the port is already bound to (say, by another Payara Micro instance), then the Payara Micro instance will simply increment the _startPort_ value and try again until it finds a port it can bind to.

For example, if there are already two Payara Micro instances running, which have bound ports 5900 and 5901, then a third instance started with a _startPort_ value of 5900 will first try to bind to 5900, then to 5901, then finally settle on 5902.

If you wish to have multiple clusters, then you can make use of the `--mcAddress` and ``mcPort` options to define a different multicast address and port; assign a different address and port to each set of instances you wish to operate in a separate cluster and they will automatically make their own cluster on the new multicast address and port. You can also use `--clusterName` and `--clusterPassword` to segregate clusters. 

## Lite Cluster Members

If you specify on the command line or through the API that a Payara Micro instance is a lite instance. Then the Payara Micro instance will join the cluster but will not store any clustered data, for example web session data or JCache data. This is very useful for a number of scenarios;

You can create a cluster topology whereby a web application is hosted in a number of payara micro instances and the garbage collection ergonomics for these instances are tuned for throughput, in addition a number of payara micro instances are also in the cluster with no applications deployed and these instances are tuned for long lived web session data. In this case the web application instances could be designated as lite cluster members to ensure no web session data is stored within their JVMs.

Lite members can also be used purely if you want a clustered payara micro instance to join the same cluster and receive CDI events or clustered events but without storing any data.

## Preventing Cluster Cross Talk

By default Payara Micro clusters automatically discover other cluster members via multicast. This can lead to the situation whereby different development environments being used by different teams cluster together as they are using the same multicast address and multicast port. This can lead to confusing errors. To prevent cluster cross-talk ensure that the multicast-address and muticast-port are set to different values on each unique cluster. In the case where this is not possible payara micro provides the capability to set a cluster name and a cluster password both through the command line or through the api. If all the multicast settings are similar, instances will only cluster together if all the instances have the same cluster name and cluster password.

## Clustering with Payara Server
Payara Micro can cluster with Payara Server and share web session and JCache data. To cluster with Payara Server just start up a Payara Micro instance with the same multicast address, multicast port, cluster name and cluster password as configured in your Payara Server.

