# Remote CDI Events in Payara Micro

Payara Micro can listen to and fire CDI events across the cluster of Payara Micro instances, and also across Payara Server instances within the same cluster. Payara Micro supports the same functionality for [remote CDI events](../extended-documentation/cdi-events.md) as provided by Payara Server. This feature has been available in Payara Micro long before it was available in Payara Server.

Since: 4.1.153

Payara Micro also provides additional methods to fire events and register listeners programmatically. You can view the methods associated with CDI Events in the [appendices](appendices/operation-methods.md#cdi-methods).

## Manual initialization of the event bus

Before version of 4.1.1.171, it was necessary to initialize the event bus using `ClusteredCDIEventBus.initialize()` manually upon startup. Although this method is still available in the API, it is not necessary anymore, since the event bus is automatically initialized after an application is started.