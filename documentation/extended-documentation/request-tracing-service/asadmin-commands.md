# Request Tracing
#### Command Reference


## `requesttracing-configure`

**Usage:** `asadmin> requesttracing-configure --enabled=true --thresholdValue=10 --thresholdUnit="SECONDS" --dynamic=true --historicaltraceenabled --historicaltracestoresize=20`

**Aim:** Enables or disables the service and provides ways to configure threshold time by specifying a value and a unit, and can store a given number of the slowest historical request traces.


#### Command Options:

| Option | Type | Description | Default | Mandatory |
|--------|------|-------------|---------|-----------|
| `--enabled=true` | Boolean | Enables or disables the service | false | Yes |
| `--thresholdValue=10` | Integer | Sets the number of time units which trigger the tracing of a request | 30 | No |
| `--thresholdUnit="SECONDS"` | TimeUnit | Sets the time unit to use for the threshold | `SECONDS` | No |
| `--dynamic=true` | Boolean | When set to true, applies the changes without a restart. Otherwise a restart is required. | false | No |
| `--historicaltraceenabled` | Boolean | When present, enables the storage of the slowest historical request traces. | false | No |
| `--historicaltracestoresize` | Integer | Sets how many request traces will be stored. | 20 | No |

The argument `--dynamic=true` is necessary to turn on the service for a running server, otherwise the change would only be applied after a server restart.

#### Example:
```
asadmin> requesttracing-configure \
    --enabled=true \
    --thresholdValue=10 \
    --thresholdUnit="SECONDS" \
    --dynamic=true \
    --historicaltraceenabled \
    --historicaltracestoresize=20
```

## `requesttracing-configure-notifier`

**Usage:** `asadmin> requesttracing-configure-notifier --notifierName="service-log" --notifierEnabled=true --dynamic=true`

**Aim:** Controls which notifier to use and enables or disables notifications.


#### Command Options:

| Option | Type | Description | Default | Mandatory |
|--------|------|-------------|---------|-----------|
| `--notifierName` | String | The name of the notifier to use | `service-log` | Yes |
| `--notifierEnabled` | Boolean | Enables or disables notifications | false | Yes |
| `--dynamic=true` | Boolean | When set to true, applies the changes without a restart. Otherwise a restart is required. | false | No |

#### Example:
In order to configure the notifier for request tracing, the asadmin command to list available notifiers should be run first:

```
asadmin> notifier-list-services
```

which will give output similar to the following:

> ```
> Available Notifier Services:
>         service-log
>
> Command notifier-list-services executed successfully.
> ```


By providing a notifier service with its name, it’s possible to assign it to the Request Tracing service. The command named `requesttracing-configure-notifier` adds a logger notifier to request tracing by enabling it as seen follows.

```
asadmin> requesttracing-configure-notifier
    --notifierName="service-log" \
    --notifierEnabled=true \
    --dynamic=true
```


## `get-requesttracing-configuration`

**Usage:** `asadmin> get-requesttracing-configuration`

**Aim:** This command can be used to list the details of the Request Tracing Service.

#### Command Options:

There are no options for this command.

#### Example:
```
asadmin> get-requesttracing-configuration
```

will give output similar to the following:

> ```
> Enabled  ThresholdUnit  ThresholdValue  Notifier Name  Notifier Enabled  
> true     SECONDS        10              service-log    true              
> Command get-requesttracing-configuration executed successfully.
> ```

## `set-requesttracing-configuration`

**Usage:** `asadmin> set-requesttracing-configuration`

**Aim:** This command can be used to set all configuration of the Request Tracing Service at once. It effectively wraps `requesttracing-configure` and `requesttracing-configure-notifier` in one command.

#### Command Options:

| Option | Type | Description | Default | Mandatory |
|--------|------|-------------|---------|-----------|
| `--enabled=true` | Boolean | Enables or disables the service | false | Yes |
| `--thresholdValue=10` | Integer | Sets the number of time units which trigger the tracing of a request | 30 | No |
| `--thresholdUnit="SECONDS"` | TimeUnit | Sets the time unit to use for the threshold | `SECONDS` | No |
| `--dynamic=true` | Boolean | When set to true, applies the changes without a restart. Otherwise a restart is required. | false | No |
| `--notifierEnabled` | Boolean | Enables or disables notifications | false | Yes |
| `--notifierDynamic=true` | Boolean | When set to true, applies the changes without a restart. Otherwise a restart is required. | false | No |
| `--historicaltraceenabled` | Boolean | When present, enables the storage of the slowest historical request traces. | false | No |
| `--historicaltracestoresize` | Integer | Sets how many request traces will be stored. | 20 | No |

#### Example:
```
asadmin> set-requesttracing-configuration
    --enabled=true \
    --thresholdValue=10 \
    --thresholdUnit="SECONDS" \
    --dynamic=true
    --notifierEnabled=true \
    --notifierDynamic=true \
    --historicaltraceenabled \
    --historicaltracestoresize=20
```
