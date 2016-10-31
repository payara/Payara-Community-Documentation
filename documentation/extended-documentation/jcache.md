# Contents

* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Using JCache in your Applications](#3-using-jcache-in-your-applications)

  * [3.1 Accessing the JSR107 Caching Provider and Cache Manager](#31-accessing-the-jsr107-caching-provider-and-cache-manager)

    * [3.1.1 Using Injection](#311-using-injection)

  * [3.2 Creating a Cache using Injection](#32-creating-a-cache-using-injection)

    * [3.2.1 Creating a custom Cache using Injection](#321-creating-a-custom-cache-using-injection)

  * [3.3 Using JCache Annotations](#33-using-jcache-annotations)


* [4. Appendices](#4-appendices)

  * [4.1 NamedCache Annotation](#41-namedcache-annotation)


# 1. Overview

This page covers how to use the JCache functionality in Payara 4.1.1.162.

JSR107 \(JCache\) is implemented in Payara by Hazelcast.

# 2. Documentation Conventions

Any paths listed throughout the documentation will use the Unix\/Linux file path structure \(forward slashes\).

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

You can also use injection to access and use the [CachingProvider](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/spi/CachingProvider.html) and [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html) embedded in Payara. Inject them into your application like so \(note, your war or jar must be an implicit or explicit bean archive i.e. contains a CDI Bean with a bean defining annotation, an EJB Session Bean or a beans.xml file\):

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

## 3.2 Creating a Cache using Injection

You can create a cache using either the `getCache` method of a [CacheManager](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/CacheManager.html), or using injection. Creating the cache with injection uses the Caching Provider and Cache Manager described above.

Creating a cache with injection can be done like so:

```Java
import javax.inject.Inject;
import javax.cache.Cache;
...
@Inject
Cache cache;
```

The name of this cache will be the canonical name of the class it is created in. Caches created in this way will also have JMX statistics and management enabled.

Starting from _Payara 4.1.1.164_, a typed cache can also be injected in the same manner:

```Java
import javax.inject.Inject;
import javax.cache.Cache;
...
@Inject
Cache<Long, Property> cache;
```

Both key and value types must be `Serializable` so that the cache can be injected correctly.

### 3.2.1 Creating a custom Cache using Injection

You can determine the name and other attributes of a cache created through injection using the `@NamedCache` annotation.

You can specify the desired custom values as a comma separated list of parameters of the `NamedCache` annotation when creating a cache.

For example, to inject a cache with a custom name and with JMX management enabled:

```Java
import fish.payara.cdi.jsr107.impl.NamedCache;
import javax.inject.Inject;
import javax.cache.Cache;
...
@NamedCache(cacheName = "custom", managementEnabled = true)
@Inject
Cache cache;
```

The full array of parameters can be seen in the [NamedCache](#41-namedcache-annotation) section of the [appendices](#4-appendices).

If you only want to set the name of the cache but don't want to depend on the `@NamedCache` annotation since it's part of the _Payara Extras_ dependencies, you can use the `@CacheDefaults` annotation on the bean class:

```Java

import fish.payara.cdi.jsr107.impl.NamedCache;
import javax.inject.Inject;
import javax.cache.Cache;
import javax.cache.annotation.CacheDefaults;
import javax.enterprise.context.ApplicationScoped;
...
@ApplicationScoped
@CacheDefaults(cacheName = "custom")
public class CacheBean {
    ...
    @Inject
    Cache cache;
    ...
}
```
Keep in mind that this solution only works if your bean has one injected cache only. If you are in a situation where you must inject more than one cache into the bean then consider using the _@NamedCache_ annotation to avoid name collisions.

## 3.3 Using JCache Annotations

Payara has the necessary interceptors implemented for allowing the full set of JCache annotations to be used.

The JCache annotations are as follows:

* [@CachePut](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CachePut.html) - Puts the specified key and value in the cache.
* [@CacheRemove](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemove.html) - Removes the specified key and value from the cache.
* [@CacheResult](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheResult.html) - Retrieves the value associated with the specified key.
* [@CacheRemoveAll](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemoveAll.html) - Removes all keys and values from the cache.
* [@CacheDefaults](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheDefaults.html) - Allows the configuration of defaults for CacheResult, CachePut, CacheRemove, and CacheRemoveAll at the class level.
* [@CacheKey](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheKey.html) - Marks a method parameter as the key of a cache.
* [@CacheValue](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheValue.html) - Marks a method parameter as the value of a cache key.

# 4. Appendices

## 4.1 NamedCache Annotation

| Configuration Option | Description | Default Value |
| --- | --- | --- |
| `String cacheName` | Sets the name of the cache. | The canonical name of the class receiving the injected cache. |
| `Class keyClass` | Sets the class of the cache keys. | _Object.class_ |
| `Class valueClass` | Sets the class of the cache values. | _Object.class_ |
| `boolean statisticsEnabled` | Enables or disables JMX statistics. | _false_ |
| `boolean managementEnabled` | Enables or disables JMX management. | _false_ |
| `boolean readThrough` | Enables or disables cache read through. If set to true, a _CacheLoader_ factory class must be specified. | _false_ |
| `boolean writeThrough` | Enables or disables cache write through. If set to true, a _CacheWriter_ factory class must be specified. | _false_ |
| `Class cacheLoaderFactoryClass` | Sets the [CacheLoader](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/integration/CacheLoader.html) factory class to be attached to the cache. | If not specified, this option is not used. |
| `Class cacheWriterFactoryClass` | Sets the [CacheWriter](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/integration/CacheWriter.html) factory class to be attached to the cache. | If not specified, this option is not used. |
| `Class expiryPolicyFactoryClass` | Sets the [ExpiryPolicy](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/expiry/ExpiryPolicy.html) factory class to be attached to the cache. | If not specified, this option is not used. |

