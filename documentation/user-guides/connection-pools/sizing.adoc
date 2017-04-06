# Connection pool sizing

Connection pools should be sized to cater for the maximum number of concurrent connections.

The maximum size should be set in accordance with the maximum number of client requests your system can process. If your application receives 100 requests and each of those requires a database connection then if your connection pool is anything less than 100 some of those requests will have to wait for a connection to either be created or become available.

The minimum size of the connection pool ensures that a number of connections to the database are always established - this means that if you have a pool with a minimum size of 10 and you receive 10 requests then all can retrieve a database connection without waiting for the pool to create a new connection.

## Setting the sizes via the admin console

Click on the connection pool name and under Pool Settings you will find Initial and Minimum Pool Size and Maximum Pool Size. Set these to your required sizes.

![Connection pool sizes in the admin console](images/connection_pools_3.jpg)

## Setting the sizes via asadmin

To set the initial & minimum pool size (to the value of 10):

```bash
asadmin> set resources.jdbc-connection-pool.test-pool.steady-pool-size=10
```

To set the maximum pool size (to the value of 200):

```bash
asadmin> set resources.jdbc-connection-pool.test-pool.max-pool-size=200
```
