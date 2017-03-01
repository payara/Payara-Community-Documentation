# Public API

Starting from release _4.1.1.171_, a new artifact has been created to gather all interfaces that compose the Public API for both Payara Server and Payara Micro.

# Use Cases

This Public API should be used in the following scenarios:

1. Java EE Developers and end users that develop web and enterprise applications that require Payara specific features outside the specifications \(and JCache\). 
2. Contributors that want to develop extensions to Payara Server or Payara Micro.

Previous to release _4.1.1.171_, if developers wanted to access these interfaces they had to declare a dependency on the `payara-micro` or `payara-embedded-all` artifacts. Since those dependencies are heavier and would include a lot of irrelevant classes and interfaces, the new API was created to simplify this scenario.

# Maven Coordinates

The public API is released as a Maven artifact in **Maven Central**. To use it in a Maven project, set the following dependency in your project's POM:

```
<dependency>
    <groupId>fish.payara.api</groupId>
    <artifactId>payara-api</artifactId>
    <version>{VERSION}</version>
    <scope>provided</scope>
</dependency>
```

Where the `{VERSION}` of the artifact corresponds with the version of Payara Server \(starting from _4.1.1.171_\).

# Github Repository

As of release release _4.1.1.171_, the Public API is hosted on a separate [GitHub repository](https://github.com/payara/Payara-API) to simplify the handling of the source code. The licensing and contribution models are exactly the same as the ones used for the main repository to host the code of Payara Server.

