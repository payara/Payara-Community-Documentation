# Enhanced Classloading 

This page covers how to use the Enhanced Class and Library Loading functionality introduced on _Payara 4.1.1.162_.  

# Default Class and Library Loading

Payara Server comes included with many standard Java libraries and packages, for example Google Guava, Jackson, Logback and others.

By default, due to the way standard classloading works, if a class is found in one of Payara Server included libraries, it will be the one used for an specific application, even if the application itself includes a different version of the same library.

Possible issues with default behavior
In some cases, application developer will want to include a different version of the libraries that are already included in Payara.
A common case is a later version of Guava or Jackson.  Another case is to include older versions of these packages for compatibility.
Unfortunately, due to the default class loading behavior, this will not be possible, and Payara-included libraries will take precedence.

# Solutions to the Class Loading issue

# 4.1 Globally override Payara-included libraries
You can set the system property `fish.payara.classloading.delegate` to `false`.
This way, any library that is included by the application developer will override the one that's included in Payara.
Class Loading is accomplished in the following order:

* Libraries From WAR files - `WEB-INF/lib` - Optional, controlled by the `<class-loader>` directive in `web.xml`
* Libraries From EAR files - usually `/lib`
* Libraries from the Domain - _${Domain}_/lib
* And finally, libraries from Payara itself - _${Product-Root}_/modules

This is a Payara-specific feature

# 4.2 WAR Files
For WAR files, you can include `<class-loader delegate="false"/>` in your `WEB-INF/glassfish-web.xml`. 
With this option, your `WEB-INF/lib/xxx.jar` libraries will take precedence over Payara-included libraries.
This option is also provided by GlassFish Server 4 Open Source Edition.

# 4.3 EAR Files
For EAR files, you can include `<classloading-delegate>false</classloading-delegate>` in your `META-INF/glassfish-application.xml` file.
With this option, your EAR-included libraries will override Payara-included libraries.

# 4.4 Payara domain
The only way to enable libraries in the _${Domain}_/lib to override Payara-included libraries ( _${Product-Root}_/modules )
is to set the system property `fish.payara.classloading.delegate` to `false` as described above.

# 5. Conclusion and Recommendations
We recommend that you set the system property `fish.payara.classloading.delegate` to `false` as this behavior is the desired behavior
for most cases.  The reason this is not the default out-of-the-box is because Payara wants to keep drop-in replacement compatibility
with GlassFish.
