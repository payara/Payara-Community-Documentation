It’s possible to configure Request Tracing Service with the asadmin tool instead of using the admin console.

The `requesttracing-configure` command enables/disables the service and provides ways to configure threshold time by specifying a value and a unit.

```
> asadmin requesttracing-configure \
    --enabled=true \
    --thresholdValue=10 \
    --thresholdUnit="SECONDS" \
    --dynamic=true
```
The argument `--dynamic=true` is necessary to turn on the service for a running server, otherwise the change would only be applied after a server restart.

In order to configure the notifier for request tracing, the asadmin command to list available notifiers should be run first:

```
> asadmin notifier-list-services
```

which will give the following output:

> ```
> Available Notifier Services:
>         service-log
> 
> Command notifier-list-services executed successfully.
> ```

By providing a notifier service with its name, it’s possible to assign it to the Request Tracing service. The command named `requesttracing-configure-notifier` adds a logger notifier to request tracing by enabling it as seen follows.

```
> asadmin requesttracing-configure-notifier
    --notifierName="service-log" \
    --notifierEnabled=true \
    --dynamic=true
```

The `get-requesttracing-configuration` command can be used to list the details of the Request Tracing Service.

```
> asadmin get-requesttracing-configuration
```

which will give the following output:

> ```
> Enabled  ThresholdUnit  ThresholdValue  Notifier Name  Notifier Enabled  
> true     SECONDS        10              service-log    true              
> Command get-requesttracing-configuration executed successfully.
> ```