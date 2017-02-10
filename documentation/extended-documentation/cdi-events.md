# Firing and Listening for remote CDI Events

Payara Server is able to listen to and fire CDI events across the Hazelcast cluster. The CDI events can be fired and listened to by applications on Payara Server instances as well as Payara Micro instances provided that they are connected to the same cluster.

This feature is not yet available in Payara Server Web Profile.

Since: 4.1.1.171 (Payara Server), 4.1.153 (Payara Micro)

## Initializing the event bus

The event bus is initialized automatically after an application is started. No additional configuration is necessary to fire and listen to remote events.

## Firing remote CDI events

In order to fire a CDI event remotely, mark it with `@Outbound` annotation:

```
@Inject
@fish.payara.micro.cdi.Outbound
Event<String> event;
```

The above will create an event with a String payload, which will be observable on remote instances in the cluster.

An outbound event can be fired as any other CDI event:

```
    event.fire("This is an event");
```

The payload passed as an argument to the `fire()` method has to implement the `Serializable` interface.

An outbound event will be fired asynchronously on a remote instance. If [loopback](#loopback) is allowed, it will be fired also on the same instance, but in a different thread. Therefore the call doesn't block the current thread.

Note: It is not possible to use additional qualifiers to match event with observers. Any additional qualifier other than `@Outbound` will mean that the event will be ignored.

## Observing remote CDI events

Remote events are received by beans, which observe CDI events that are marked by the `@Inbound` qualifier annotation:

```
public void receiveEvent(@Observes @Inbound String message) {
}
```

The observers may reside in any application running on one or more instances in a Hazelcast cluster, and they will listen to events fired in an application running on any instance within the same cluster. By default, events will be fired on all remote cluster instances (all instances except the one, in which the event was fired).

An event will be matched with observers by the payload class, using the same rules as usual CDI events. Observers will receive events that are assignable to the observed class.

Note: Additional qualifiers are not supported. The event will always be fired with no qualifiers other than `@Inbound`. Further filtering of events is possible using an [event name](#event-name).

## Additional options

### Event name

It is possible to tag a remote event with a name. In that case, only observers that listen to events of the same name will receive such events. This is an alternative to using qualifiers, which are not supported.

To fire an event with a name:

```
@Inject
@Outbound(eventName = "MyEvent")
Event<String> event;
```

To receive the above named event:

```
public void receiveEvent(@Observes @Inbound("MyEvent") String message) {
```

### Instance name

By default, all remote instances in the same cluster will receive an outbound event, which matches the observed class and event name. If you want to target specific instances in the cluster, it is possible to define one or more target instances for an outbound event:

```
@Inject
@Outbound(instanceName = "Instance-1")
Event<String> event;
```

Several instance names are configured as an array:

```
@Inject
@Outbound(instanceName = {"Instance-1", "Instance-2"})
Event<String> event;
```

Instance name of Payara DAS is its name, `server` by default. Instance name of a standalone instance is its instance name. Instance name of a Payara Micro instance is the name provided the `--name` command line argument, or it's generated automatically.

### Loopback

When an outbound event is fired, by default, it is treated as a remote message and will be delivered only to remote instances in the cluster. It will not be delivered to listeners on the same server instance.

If it should be delivered also to local observers, it can be marked with `loopBack` boolean attribute:

```
@Inject
@Outbound(loopBack = true)
Event<String> event;
```

Such event will be delivered to observers on all instances in the cluster, including the local instance.

## Dynamic configuration

If required, events can also be configured programmatically, not only using static `Outbound` annotation next to the injection point. Although there is not special API to support it, CDI already supports programmatic configuration of events.

The following is an example of how to configure and fire an outbound event programmatically without using any injection points:

```java
CDI.current().getBeanManager().fireEvent("This is an event", new Outbound() {
                @Override
                public String eventName() {
                    return System.getProperty("eventname");
                }

                @Override
                public boolean loopBack() {
                    return Boolean.getBoolean(System.getProperty("loopback"));
                }

                @Override
                public String instanceName() {
                    return System.getProperty("instanceName");
                }

                @Override
                public Class<? extends Annotation> annotationType() {
                    return this.getClass();
                }
            });
```

The above code creates a dynamic instance of the `@fish.payara.micro.cdi.Outbound` annotation and fires the event `"This is an event"` using a bean manager retrieve via a static `CDI.current`()` method.