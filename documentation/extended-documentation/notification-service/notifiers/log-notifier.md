# Log Notifier

The log notifier is the only notifier which is enabled by default when the notification service is activated.

The default output for the log notifier is the configured instance log file, which is either the server.log file or cluster.log file, depending on the instance configuration.

The log notifier only handles the output of notifications from the notification service sent to the log and is not responsible for any other log output - more details on Payara Server logging can be found on the logging page.
## Configuration

By default, the log notifier will receive notifications from the notification service and output them to the configured logs when activated.

### Payara Configuration

The log notifier is, by default, disabled on new domains.

The [notification service](/documentation/extended-documentation/notification-service/notification-service.md)](/documentation/extended-documentation/notification-service/notification-service.md) will automatically enable the log notifier when activated - the log notifier will not work without the notification service.

To enable the log notifier specifically, run the command:

```Shell
asadmin notification-log-configure --enabled=true --dynamic=true
```

More details on specific commands for the notification service can be found on the [notification service](/documentation/extended-documentation/notification-service/notification-service.md](/documentation/extended-documentation/notification-service/notification-service.md) page.

### Log Configuration

To get the current configuration of the log notifier, run the command below:

```Shell
asadmin get-log-notifier-configuration
```

This will return the details of the current log notifier configuration; see below for an example:

```Shell
Enabled
true
```
