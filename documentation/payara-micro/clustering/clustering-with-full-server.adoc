# Clustering with Payara Server

Payara Micro can cluster with Payara Server and share web session and JCache data. To cluster with Payara Server, just start a Payara Micro instance with the same Hazelcast cluster configuration as configured in your Payara Server \(e.g. multicast address, multicast port, cluster name, and cluster password\).

When Payara Server DAS is connected to the same Hazelcast cluster, the Admin console can display the details about Payara Micro instances in the cluster. See [Management of Hazelcast Cluster Members](/documentation/extended-documentation/hazelcast/cluster-members.md) section for details.

