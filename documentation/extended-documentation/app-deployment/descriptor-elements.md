# Elements of the Deployment Decriptor Files

## classloading-delegate
With this option, the libraries included in the EAR assembly will override libraries included in Payara Server distribution. 
For more information about how Payara Server loads the required classes and libraries, see the [Classloading](../classloading.md) section.

## enable-implicit-cdi

Configure whether the implicit CDI scanning, as defined by CDI 1.1, is in place for all modules inside the EAR assembly. The default value is `true`. 
If implicit CDI scanning causes problems for an EAR assembly, the value `false` will disable implicit CDI scanning for all CDI modules inside the EAR assembly. 
This value can be forcibly overridden during deployment, either by an argument to asadmin deploy command, or by a checkbox in the web admin console.

