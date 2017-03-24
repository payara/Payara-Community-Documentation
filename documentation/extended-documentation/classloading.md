# Enhanced Classloading 

This page covers how to use the Enhanced Class and Library Loading functionality introduced on _Payara 4.1.1.162_.  

# Default Class and Library Loading

Payara Server comes included with many standard Java libraries and packages, for example **Google Guava**, **Jackson**, **Logback** and others.

By default, due to the way standard classloading works; if a class is found in one of the library or modules that are included within Payara Server, it will be the one used for an specific application, even if the application itself includes a different version of the same library.

## Possible issues with default behavior

In some cases, application developers will want to include different version of the libraries that are already included in Payara. Here are some of the most common use cases:

1. 

A common case is a later version of Guava or Jackson.  Another case is to include older versions of these packages for compatibility.
Unfortunately, due to the default class loading behavior, this will not be possible, and Payara-included libraries will take precedence.

# Solutions to the Class Loading issue

## Globally override Payara-included libraries

You can set the system property `fish.payara.classloading.delegate` to `false`.
This way, any library that is included by the application developer will override the one that's included in Payara.
Class Loading is accomplished in the following order:

* Libraries From WAR files - `WEB-INF/lib` - Optional, controlled by the `<class-loader>` directive in `web.xml`
* Libraries From EAR files - usually `/lib`
* Libraries from the Domain - _${Domain}_/lib
* And finally, libraries from Payara itself - _${Product-Root}_/modules

This is a Payara-specific feature

## WAR Files

For WAR files, you can include `<class-loader delegate="false"/>` in your `WEB-INF/glassfish-web.xml`. 
With this option, your `WEB-INF/lib/xxx.jar` libraries will take precedence over Payara-included libraries.
This option is also provided by GlassFish Server 4 Open Source Edition.

## EAR Files

For EAR files, you can include `<classloading-delegate>false</classloading-delegate>` in your `META-INF/glassfish-application.xml` file.
With this option, your EAR-included libraries will override Payara-included libraries.

# Payara Domain

The only way to enable libraries in the _${Domain}_/lib to override Payara-included libraries ( _${Product-Root}_/modules) is to set the system property `fish.payara.classloading.delegate` to `false` as described above.

# Extreme Classloading Isolation

Starting from release _4.1.1.171_, it's possible to configure a extreme isolation level on the classloading mechanism for applications deployed to Payara Server. With this extreme isolation behavior, a deployed application can force the server to load only classes that belong to **whitelisted packages** defined on its deployment descriptors. 

To configure whitelist packaging you can use the `<whitelist-package>` element on the _glassfish-web.xml_ (WAR artifacts) or the _glassfish-application.xml_ (EAR artifacts). This element can be included multiple times to whitelist multiple packages. Here is an example of whitelisting both the **Google Guava** and **Jackson** packages for a web application:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE glassfish-web-app PUBLIC "-//GlassFish.org//DTD GlassFish Application Server 3.1 Servlet 3.0//EN" "http://glassfish.org/dtds/glassfish-web-app_3_0-1.dtd">
<glassfish-web-app error-url="">
  ...
  <class-loader delegate="false"/>
  <whitelist-package>com.google.guava</whitelist-package>
  <whitelist-package>com.fasterxml.jackson</whitelist-package>
</glassfish-web-app>
```

The whitelist syntax is simple: Define the name of the package that is going to be whitelisted. For example writing `com.google` would whiltelist all Google libraries included with the server, while `com.google.guava` would only whitelist the Google Guava library.

To enable this extreme isolation behavior, at least one `whitelist-package` must be defined in the appropriate descriptor. 

