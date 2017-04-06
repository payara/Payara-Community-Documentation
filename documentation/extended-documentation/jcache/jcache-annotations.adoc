# Using JCache Annotations

Payara has the necessary interceptors implemented for allowing the full set of JCache annotations to be used.

The JCache annotations are as follows:

* [@CachePut](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CachePut.html) - Puts the specified key and value in the cache.
* [@CacheRemove](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemove.html) - Removes the specified key and value from the cache.
* [@CacheResult](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheResult.html) - Retrieves the value associated with the specified key.
* [@CacheRemoveAll](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheRemoveAll.html) - Removes all keys and values from the cache.
* [@CacheDefaults](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheDefaults.html) - Allows the configuration of defaults for CacheResult, CachePut, CacheRemove, and CacheRemoveAll at the class level.
* [@CacheKey](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheKey.html) - Marks a method parameter as the key of a cache.
* [@CacheValue](https://ignite.incubator.apache.org/jcache/1.0.0/javadoc/javax/cache/annotation/CacheValue.html) - Marks a method parameter as the value of a cache key.
