# Persistent EJB timers

Payara Micro supports persistent EJB timers which are stored across Payara Micro instances within the cluster, backed by distributed Hazelcast cache. The timers are persisted as long as the cluster is running, even though the member, which created the timer goes down.

In order to make use of a persistent timer in Payara Micro, an application must declare a timer to be persistent, as defined by the EJB specification. This is actually the default, unless timers are specified as non-persistent.

The second requirement is to specify a name for every Payara Micro instance which runs an application with persistent timers. Each such instance has to have its own unique name.

*Persistent timers are not coordinated across the Payara Micro cluster. They are always executed on an instance with the same name that created the timers.*

## Requirements to setup a persistent timer

 - the timer has to be persistent, ie. the value of `persistent` attribute is not forcibly set to `false`
 - Payara Micro instance is given a unique name using `--name` argument
 - Payara Micro instance is a member of a Hazelcast cluster

The Hazelcast cluster can be formed by other Payara Micro instances, Payara Server instances with Hazelcast turned on, or by standalone Hazelcast instances.

## How EJB timers are persisted

Once timers are scheduled, either by the `@Schedule` annotation or using the `TimerService`, the schedule is stored into the Hazelcast distributed cache. The schedule is given a key, which is the name of the Payara Micro instance that created the timer. If that instance goes down, the timer will be recreated on another instance with the same name once it joins the cluster. Until that time, the timer becomes inactive. The timer would not be recreated on other members of the cluster or any new members of the cluster with a different name.
