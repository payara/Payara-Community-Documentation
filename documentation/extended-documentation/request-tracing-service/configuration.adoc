# Request Tracing
#### Configuration

The request tracing service configuration is stored in the `domain.xml` file. As with any aspect of Payara Server configuration, we do not recommend modifying the `domain.xml` due to the likelihood of typos causing problems.

```
<request-tracing-service-configuration
    threshold-value="30"
    threshold-unit="SECONDS"
    enabled="true">
    <log-notifier enabled="true"></log-notifier>
</request-tracing-service-configuration>
```

As shown above, there are three main attributes which can be configured, in addition to a notifier:

* `threshold-value`
  * This defines the number of units beyond which a request will be traced.
* `threshold-unit`
  * This defines the time duration per unit. The accepted options are any valid [java.util.concurrent.TimeUnit](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/TimeUnit.html) values. By default the threshold value is **3 MINUTES**. In the snippet given above, it’s set to *30 SECONDS*.
* `enabled`
  * Whether or not the service is turned on

There is an additional configuration option which can be seen in the admin console, or specified as an argument to the [asadmin command](asadmin-command.md) called `dynamic`. Setting this to true will activate the change *without a server restart.*

![Request Tracing Configuration in the Admin Console](/images/request-tracing-configuration-admin-console.png)

Not included in the admin console for {{ book.currentVersion }} is an option to set the notifier type. This is intentional for this tech-preview release, since the general notifier service is released with only one available notifier. When further notifiers are added, the option to specify the type of notifier will be added.

----

#### See Also

* [Notification Service](/documentation/extended-documentation/notification-service)