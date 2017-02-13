# Contents

* [1. Overview](#1-overview)
* [2. Use Cases](#2-use-cases)
* [3. Maven Coordinates](#3-maven-coordinates)
* [4. Current Interfaces](#4-current-interfaces)
* [5. Github Repository](#5-github-repository)

# 1. Overview

Starting from release _4.1.1.171_, a new artifact has been created to gather all interfaces that compose the Public API for both Payara Server and Payara Micro.

# 2. Use Cases

This Public API should be used on the following scenarios:

1. Java EE Developers and end users that develop web and enterprise applications that require Payara specific features outside the specifications \(and JCache\). 
2. Contributors that want to develop extensions to Payara Server or Payara Micro.

Previous to release _4.1.1.171_, if developers wanted to access these interfaces they had to declare a dependency to the `payara-micro` or `payara-embedded-all` artifacts. Since those dependencies are heavier and would include a lot of irrelevant classes and interfaces, the new API was created to simplify this scenario.

# 3. Maven Coordinates

To access the public API, using **Maven** is the recommended way to go. Set the following dependency in your project's POM:

```
<dependency>
    <groupId>fish.payara</groupId>
    <artifactId>payara-api</artifactId>
    <version>{VERSION}</version>
    <scope>provided</scope>
</dependency>
```

Where the `{VERSION}` of the artifact corresponds with the version of Payara Server \(starting from _4.1.1.171_\)

This artifact is published on the **Maven Central** repository, so no additional repository definitions are needed.

# 4. Current Interfaces

Currently, the following interfaces are included in the API:

* `fish.payara.cdi.jsr107.imp.NamedCache` \(Used for **JCache** propietary features\)
* `fish.payara.requesttracing.api.Traced` \(Used for **Request Tracing**\)

In the future, more interfaces used for Payara Server extensions will be moved to this API.

# 5. Github Repository

The Public API is hosted on a separate [GitHub repository](https://github.com/payara/Payara-API) to simplify the handling of the source code. The licensing and contribution models are exactly the same as the ones used for the main repository to host the code of Payara Server.

