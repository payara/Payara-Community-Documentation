# Notification Service

Payara Server version 4.1.1.163 introduced a general Notification service in order to log events which come from other services, such as the [Health Check service](/documentation/extended-documentation/health-check-service/health-check-service.md) or the [Request Tracing service](/documentation/extended-documentation/request-tracing-service/request-tracing-service.md)

The Notification service provide disseminating of notification events through various channels that are being created by Request Tracing Services and/or Health Check Services. As of {{ book.currentVersion }}, the Notification service integrates with log notification mechanism which can be seen in the `domain.xml`:

```
<notification-service-configuration enabled="true">
    <log-notifier-configuration enabled="true" />
</notification-service-configuration>
```


The main configuration tag `notification-service-configuration` which has only one attribute named `enabled`, which can be set to either `true` or `false`. and this enables or disables the whole notification distributing.

The `<log-notifier-configuration>` tag registers a log notifier to the pub-sub model of notification service where it subscribes to each log notification event that would get published either by health check services or request tracing services.

* [Asadmin Commands](asadmin-commands.md)