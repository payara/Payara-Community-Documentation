# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Using JCache in your Applications](#3-using-jcache-in-your-applications)
  * [3.1 Accessing the JSR107 Caching Provider and Cache Manager](#31-accessing-the-jsr107-caching-provider-and-cache-manager)
    * [3.1.1 Using Injection](#311-using-injection)
  * [3.2 Using JCache Annotations](#32-using-jcache-annotations)


# 1. Overview
This page covers how to use the JCache functionality in Payara 4.1.151.  
JSR107 (JCache) is implemented in Payara by Hazelcast.

# 2. Documentation Conventions
Any paths listed throughout the documentation will use the Unix/Linux file path structure (forward slashes).

# 3. Using JCache in your Applications
The following section will detail how to access and use JCache in your code.  

## 3.1 Accessing the JSR107 Caching Provider and Cache Manager
To create a [Cache](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/Cache.html), you will need a [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html). The embedded Hazelcast member in Payara has a [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html) registered to JNDI, so you do not have to create your own. To access them, import the following classes and initialise two variables like so:

```Java
import javax.cache.spi.CachingProvider;
import javax.cache.CacheManager;
...
Context ctx = new InitialContext();
CachingProvider provider = (CachingProvider) ctx.lookup("payara/CachingProvider");
CacheManager manager = (CacheManager) ctx.lookup("payara/CacheManager");
```

### 3.1.1 Using Injection
You can also use injection to access and use the [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html) embedded in Payara. Inject them into your application like so (note, your war or jar must be an implicit or explicit bean archive i.e. contains a CDI Bean with a bean defining annotation, an EJB Session Bean or a beans.xml file):

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

## 3.2 Using JCache Annotations
Payara has the necessary interceptors implemented for allowing the full set of JCache annotations to be used.

The JCache annotations are as follows:

* [@CachePut](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CachePut.html) - Puts the specified key and value in the cache.
* [@CacheRemove](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemove.html) - Removes the specified key and value from the cache.
* [@CacheResult](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheResult.html) - Retrieves the value associated with the specified key.
* [@CacheRemoveAll](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemoveAll.html) - Removes all keys and values from the cache.
* [@CacheDefaults](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheDefaults.html) - Allows the configuration of defaults for CacheResult, CachePut, CacheRemove, and CacheRemoveAll at the class level.
* [@CacheKey](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheKey.html) - Marks a method parameter as the key of a cache.
* [@CacheValue](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheValue.html) - Marks a method parameter as the value of a cache key.
