# Elements of the Deployment Descriptor Files
This page is a reference for extra elements added to either the `glassfish-application.xml` or the `glassfish-web.xml` files in Payara Server.

### `classloading-delegate`
With this option, the libraries included in the EAR assembly will override libraries included in Payara Server distribution. 
For more information about how Payara Server loads the required classes and libraries, see the [Classloading](../classloading.md) section.

### `enable-implicit-cdi`

In a WAR file, it is possible to set the property `bean-discovery-mode` equal to `none` to turn off implicit scanning of the archive for bean defining annotations, as defined by CDI 1.1. This has been made available as part of the CDI 1.1 specification; the default value of this setting is defined as `annotated` in the specification, so the archive is scanned for any bean-defining annotations.

In the `glassfish-application.xml` deployment descriptor for an EAR file, it is now possible to set the property `enable-implicit-cdi` to `false` to achieve the same goal for all modules inside the EAR assembly. The default value is `true`, in line with the default value for WAR files.

If implicit CDI scanning causes problems for an EAR assembly, the value `false` will disable implicit CDI scanning for all CDI modules inside the EAR assembly:

```xml
<glassfish-application>
  <enable-implicit-cdi>false</enable-implicit-cdi>
</glassfish-application>
```

The default behaviour of the admin console is for the checkbox for implicit CDI scanning to be enabled; As of the 164 release of Payara Server, however, the checkbox will take the value of `enable-implicit-cdi` in the `glassfish-application.xml`, or the attribute `bean-discovery-mode="none"` from the `beans.xml` file in a WAR.

### `scanning-exclude` and `scanning-include`
Modern WAR and EAR files very often include a number of 3rd party JARs. In situations where some JARs require CDI scanning and others may break if scanned, these can now be explicitly included or excluded from scanning.

Both the `glassfish-application.xml` and the `glassfish-web.xml` files support the following directives:

```xml
<scanning-exclude>*</scanning-exclude>
<scanning-include>ejba*</scanning-include>
<scanning-include>conflicting-web-library</scanning-include>
```

In the above example, all JARs will be excluded by default, then all JARs beginning with `ejba` will be scanned, along with the JAR named `conflicting-web-library`.