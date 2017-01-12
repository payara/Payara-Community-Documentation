# Automatic Clustering

## The multicast discovery

The integration of Hazelcast into Payara Micro allows instances to automatically, and dynamically, cluster together. When two instances are pointed at the same multicast address and port, they will automatically cluster together.

You can see evidence of the automatic clustering by simply starting two instances (with different HTTP port configurations), and you should see the following in the log output:

```
Members [2] {
Member [192.168.174.130]:5900 this
Member [192.168.174.130]:5901
```

The `--startPort` option is used to determine which clustering port the Payara Micro instance will **first** try to bind to. If the port is already bound to (say, by another Payara Micro instance), then the Payara Micro instance will simply increment the _startPort_ value and try again until it finds a port it can bind to.

For example, if there are already two Payara Micro instances running, which have bound ports 5900 and 5901, then a third instance started with a _startPort_ value of 5900 will first try to bind to 5900, then to 5901, then finally settle on 5902.

If you wish to have multiple clusters, then you can make use of the `--mcAddress` and ``--mcPort` options to define a different multicast address and port; assign a different address and port to each set of instances you wish to run in a separate cluster and they will automatically make their own cluster on the new multicast address and port. You can also use `--clusterName` and `--clusterPassword` to segregate clusters.

## Preventing Cluster Cross Talk

By default Payara Micro clusters automatically discover other cluster members via multicast. This can lead to the situation whereby different development environments being used by different teams cluster together as they are using the same multicast address and multicast port. This can lead to confusing errors. To prevent cluster cross-talk make sure that the multicast-address and multicast-port are set to different values on each unique cluster. In the case where this is not possible Payara Micro provides the ability to set a cluster name and a cluster password both through the command line or through the API. If all the multicast settings are similar, instances will only cluster together if all the instances have the same cluster name and cluster password.


## Other forms of discovery

Besides the multicast discovery, Hazelcast supports other forms of discovery, e.g. by specifying a range of IP addresses (via the tcp joiner). These forms of discovery are not configurable directly from Payara Micro, but can be configured using a standard Hazelcast configuration file provided with the `--hzConfigFile` command line argument.
