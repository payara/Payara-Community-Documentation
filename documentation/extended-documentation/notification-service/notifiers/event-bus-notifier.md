# CDI Event Bus Notifier

[CDI event bus](../cdi-events.md) is a mechanism provided by Payara Server to exchange messages among applications across the Hazelcast cluster.

The Event Bus Notifier now provides a way to send notifications from the 
[Notification service](../notification-service.md) as an outbound event that can be received by applications observing the corresponding inbound event.

## Requirements

Hazelcast must be enabled for CDI Event Bus to be available.

## Listening for notifications in an application

If Event Bus notifier is enabled, notifications can be observed by applications deployed in the same Hazelcast cluster. In order to do this, an application needs to define a CDI observer method, with an argument annotated by `@Inbound` qualifier and of `EventbusMessage` type:


XXXXXXXXXXXXXXXXXXXXXXXXx

See  https://omihalyi@bitbucket.org/payara/simple-test-app.git branch CDI_event_bus_notifier