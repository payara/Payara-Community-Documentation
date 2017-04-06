# Accessing the Caching Provider and Cache Manager

To create a [Cache](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/Cache.html), you will need to access [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) or [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html). Both are provided by Hazelcast embedded in Payara Server.

## Using Injection

You can use injection to access and use the [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html) embedded in Payara. Inject them into your application like so :

```Java
import javax.cache.CacheManager;
import javax.cache.spi.CachingProvider;
import javax.inject.Inject;
...
@Inject 
CacheManager manager;
@Inject
CachingProvider provider;
```

NOTE: Your war or jar must be an implicit or explicit bean archive, i.e. contains a CDI Bean with a bean defining annotation, an EJB Session Bean or a beans.xml file.

## Using JNDI

Embedded Hazelcast in Payara Server has a [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html) registered to JNDI, so you do not have to create your own. To access them, import the following classes and initialise two variables like so:

```Java
import javax.cache.spi.CachingProvider;
import javax.cache.CacheManager;
...
Context ctx = new InitialContext();
CachingProvider provider = (CachingProvider) ctx.lookup("payara/CachingProvider");
CacheManager manager = (CacheManager) ctx.lookup("payara/CacheManager");
```
