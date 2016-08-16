# Request Tracing Service
_WARNING: This is a tech preview only and unsupported for production in {{ book.currentVersion }}_


The Request Tracing Service provides tracing facilities for Servlet request events. The service logs each request in detail; capturing EJB method calls and web service invocations. The service can be configured to inform the user of a threshold breach during request execution.

By logging requests that exceed the specified threshold, it helps users to detect long running requests and give insight to recover from the bottlenecks that arise within the application.

* [Asadmin Commands](asadmin-commands.md)
* [Configuration](configuration.md)
