# Notification Service

Payara Server version 4.1.1.163 introduced a general Notification service in order to log events which come from other services, such as the [Health Check service](/documentation/extended-documentation/health-check-service/health-check-service.md) or the [Request Tracing service](/documentation/extended-documentation/request-tracing-service/request-tracing-service.md)

The Notification service provides dissemination of notification events through various channels that are being created by Request Tracing Services and/or Health Check Services. As of the version 4.1.1.163, the Notification service integrates with log notification mechanism which can be seen in the `domain.xml`:

```
<notification-service-configuration enabled="true">
    <log-notifier-configuration enabled="true" />
</notification-service-configuration>
```


The main configuration tag `notification-service-configuration`  has only one attribute named `enabled`, which can be set to either `true` or `false`. This enables or disables the whole notification distributing.

The `<log-notifier-configuration>` tag registers a log notifier to the pub-sub model of the notification service. The notifier subscribes to each log notification event that would get published either by health check services or request tracing services, and writes information about the event into the server log file.

The default value for the attribute `enabled` is `false` for both `notification-service-configuration` and `log-notifier-configuration`. This would mean that notifications are ignored.
However, each stock Payara Server domain is configured with log notifier enabled in the domain.xml, by setting `enabled="true"` for both elements. This is the recommended setup until more notifiers are available. This setup ensures that notification messages are always written into the log file.

The Notification service can be configured through the admin console:

![Notification service admin console screenshot](/images/notification-configuration.png)

In {{ book.currentVersion }}, the only available notifier is the `service-log` notifier, so configuration options are limited.

* [Asadmin Commands](asadmin-commands.md)
