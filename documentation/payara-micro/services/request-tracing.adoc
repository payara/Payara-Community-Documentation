# Request Tracing in Payara Micro

The [request tracing service](/documentation/extended-documentation/request-tracing-service/request-tracing-service.md) was made available in Payara Micro from the 4.1.1.164 release. The service itself is exactly the same and will trace all the same events.

### Usage
Payara Micro exposes 3 command line options to configure request tracing. To be explicit about the desired configuration, all three arguments can be used, but this is not necessary since the command to enable tracing can also accept configuration.

Since all three options can be specified with an extra parameter following the `--enableRequestTracing` argument as a shorthand, a detailed summary of shorthand usage is given below. the main summary.

#####Configuration Options

| Parameter | Summary |
| -- | -- |
| `enableRequestTracing` | <p>Enables the service when present.</p><p>A supplementary parameter can be provided with this option to encapsulate the value and unit options, for example, the following will enable the service with a threshold of 4ms: </p>`java -jar payara-micro.jar --enableRequestTracing 4ms`  |
| `requestTracingThresholdUnit` | <p>Accepts a String value determining the time unit, defaulting to seconds if no value is given. The accepted strings are (case insensitive):</p>`NANOSECONDS`, `MICROSECONDS`, `MILLISECONDS`, `SECONDS`, `MINUTES`, `HOURS`, and `DAYS`. |
| `requestTracingThresholdValue` | Accepts a `long` to determine the threshold value before a request is traced, defaulting to 30 if no value is entered. |

#####Shorthand Notation

To enable and configure request tracing with a single command, the `--enableRequestTracing` option allows you to provide **one** string following it to set the threshold unit and/or value.

In other words, the value and unit need to be a single string with no spaces, so `500ms` would be allowed, but `500 ms` would not. In the second case, the unit is ignored and the default `SECONDS` is kept.

Notation for units is as follows:

| Unit | Acceptable notation |
| -- | -- |
| `NANOSECONDS` | `Nanoseconds` (case-insensitive)<br />`Nanosecond` (case-insensitive)<br />`ns` |
| `MICROSECONDS` | `Microseconds` (case-insensitive)<br />`Microsecond` (case-insensitive)<br />`us`<br />`μs` |
| `MILLISECONDS` | `Milliseconds` (case-insensitive)<br />`Millisecond` (case-insensitive)<br />`ms`
| `SECONDS` | `Seconds` (case-insensitive)<br />`Second` (case-insensitive)<br />`s` |
| `MINUTES` | `Minutes` (case-insensitive)<br />`Minute` (case-insensitive)<br />`Mins` (case-insensitive)<br />`Min` (case-insensitive)<br />`m` |
| `HOURS` | `Hours` (case-insensitive)<br />`Hour` (case-insensitive)<br />`h` |
| `DAYS` | `Days` (case-insensitive)<br />`Day` (case-insensitive)<br /> `d`|
&nbsp;  
**Example usages**

- Enable request tracing  
`java -jar payara-micro.jar --enableRequestTracing`

- Enable request tracing and set threshold unit to nanoseconds (*`value` defaults to `30`*)  
`java -jar payara-micro.jar --enableRequestTracing ns`

- Enable request tracing and set threshold value to 2 (*`unit` defaults to `SECONDS`*)  
`java -jar payara-micro.jar --enableRequestTracing 2`

- Enable request tracing and set threshold to 4 microseconds  
`java -jar payara-micro.jar --enableRequestTracing 4ms`

----

#####Warning
Exercise caution when using the shorthand notation together with other parameters. Due to the way the parser works, the last parameter entered will override the previous. For example:

- `java -jar payara-micro.jar --requestTracingThresholdUnit DAYS --enableRequestTracing 1ns`  
will enable request tracing, and set the threshold to `1 NANOSECOND`

- `java -jar payara-micro.jar --enableRequestTracing 1ns --requestTracingThresholdUnit DAYS`  
will enable request tracing, and set the threshold to `1 Day`