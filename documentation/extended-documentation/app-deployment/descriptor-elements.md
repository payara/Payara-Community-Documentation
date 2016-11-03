# Elements of the Deployment Decriptor Files

## classloading-delegate
With this option, the libraries included in the EAR assembly will override libraries included in Payara Server distribution. 
For more information about how Payara Server loads the required classes and libraries, see the [Classloading](../classloading.md) section.

## enable-implicit-cdi

Configure whether the implicit CDI scanning, as defined by CDI 1.1, is in place for all modules inside the EAR assembly. The default value is `true`. 
If implicit CDI scanning causes problems for an EAR assembly, the value `false` will disable implicit CDI scanning for all CDI modules inside the EAR assembly. 
This value can be forcibly overridden during deployment, either by an argument to the `asadmin deploy` command, or by a checkbox in the web admin console.

## container-initializer-enabled

Configure whether to enable or disable the calling of `ServletContainerInitializer` component classes defined in JAR files bundled inside the WAR assembly.

For performance considerations, you can explicitly disable the servlet container initializer by configuring the container-initializer-enabled element to `false`. This can help deploy web applications that cause conflicts with a custom bootstrapping process or depend on external libraries to complete it.


## default-role-mapping (_property_)

With this property, you can set whether to enable the default group to role mappings for your application's security settings. This element is set up as a `property` element with a `Boolean` value attribute like this:

```xml
<property name="default-role-mapping" value="true">
  <description>Enable default group to role mapping</description>
</property>
```

If you enable the default group to role mappings, all named groups in the application's linked security realm will be mapped to a role of the same name, saving you the time of having to redefine the same roles and map them to the realm groups each time they are added/changed/deleted, etc. This will have the same effect as executing the following asadmin command:

```sh
asadmin set configs.config.server-config.security-service.activate-default-principal-to-role-mapping=true
```

Except it's effect will only limit itself to the application instead of all applications deployed on the server. This setting is configured by default to `true` on the [production-ready-domain](extended-documentation/production_ready_domain.md)

The default value of this property is `false`. This property can be set in the _glassfish-web_, _glassfish-ejb-jar_ and _glassfish-application_ XML deployment descriptors. On an **EAR** assembly, only the property set at the _glassfish-application.xml_ takes effect and the ones in the _glassfish-web.xml_ and _glassfish-ejb-jar.xml_ are ignored. Setting this configuration property on these files will always override any setting configured on the server.




