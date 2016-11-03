# Request Tracing Service
_WARNING: This is a tech preview only and unsupported for production in {{ book.currentVersion }}_


The Request Tracing Service provides tracing facilities for Servlet request events. The service logs each request in detail; capturing EJB method calls and web service invocations. The service can be configured to inform the user of a threshold breach during request execution.

The service helps users to detect application slowness by logging requests that exceed a given threshold. The trace data from long-running requests gives insight to help recover from bottlenecks that may arise within an application.

The service is available in both Payara Server and Payara Micro, though configuration is different for Payara Micro.

* [Asadmin Commands](asadmin-commands.md)
* [Configuration](configuration.md)
