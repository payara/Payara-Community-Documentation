# Default Thread Pool Size

Starting from Payara Server _4.1.1.164_, the thread pool `thread-pool-1` has a minimum size of **2** instead of **1**. 

This includes the benefit of allowing users to execute tasks concurrently using the `ManagedExecutorService` and `ManagedScheduledExecutorService` components included with Java EE Concurrency Utilities ([JSR-236](https://jcp.org/ja/jsr/detail?id=236 "Concurrency Utilities for Java EE")). Without this change, new tasks submitted to these service components would just have been queued in a linear fashion.

This minor optimization is configured on the _default domain_ template (so all newly created domains inherit it) and is also included in the [Production Ready](/documentation/extended-documentation/production-ready-domain.md) domain template as well, across all profiles (Full, Web, Embedded and Micro).