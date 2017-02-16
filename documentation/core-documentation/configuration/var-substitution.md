# Variables in the configuration

Variable references in the configuration are useful for reusing the same configuration in several scenarios, e.g. for several instances in the same cluster, or to provide an environment-specific configuration from the environment later when Payara Server is started.

## References to system properties

Variable references to system properties start with `${`, followed by the name of the variable, and end with `}`. An example of a variable reference that refers to a `java.home` system property is:

```
${java.home}
```

Values of system properties can be specified by:

 - the JVM (standard JVM properties like `java.home`)
 - Payara Server (a set of predefined variables, such as `com.sun.aas.instanceRoot`)
 - the `create-system-properties` asadmin command (or in the Admin console `System properties` section)
 - a JVM option prefixed with `-D`

When custom properties are specified, their value can also contain other variable references. It is therefore possible to define a system property using other system properties or environment variables.

Since: GlassFish Open Source Edition 4.0

## References to environment variables

Since version 4.1.1.171, Payara Server also supports references to environment variables.

They are used like system property references, but contain an extra `ENV` qualifier and equals sign before the variable name. An example of a reference to an environment variable `HOME` then looks like:

```
${ENV=HOME}
```

Environment variables need to be specified in the environment before a Payara instance is started.

Since: Payara Server 4.1.1.171

## How to use variable references

Variable references can be used inside text values in the following configuration files:

 - domain.xml (inside attribute values or inside text nodes that contain a configuration value)
 - logging.properties (inside property values)

Multiple variable references can be used within the same configuration value, concatenating any number of variable references and plain text chunks.