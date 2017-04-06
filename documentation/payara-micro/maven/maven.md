# Maven Support

## Artifacts in Maven Central

Payara Micro has been uploaded to Maven Central, allowing you to include it as a dependency in your POM.  
This allows you to easily add the required Payara Micro classes and methods to your application to use Payara Micro programmatically.

In your project's POM, include the following dependency:

```MAVEN_POM
<dependency>
    <groupId>fish.payara.extras</groupId>
    <artifactId>payara-micro</artifactId>
    <version>${payara.version}</version>
</dependency>
```

`${payara.version}` is a Maven property, which specifies the version of the Maven artifact, e.g. {{ book.currentVersion }}.

Starting from release _4.1.1.171_, you need to add a dependency to the [Public API](/documentation/extended-documentation/app-deployment/public-api.md) when developing applications that use proprietary features (`@Traced` or `@NamedCache` for example)  

## Run Payara Micro using Maven

It is possible to run Payara Micro using the `exec` goal of the Maven Exec plugin. Additionally, you can use the Maven Dependency Plugin to either refer to the JAR file of the `payara-micro` artifact in local maven repository, or to copy it to the project directory.

For example, in order to build and execute the maven WAR artifact in Payara Micro, you can issue the `mvn package exec:exec` command with the following Exec and Dependency plugin configuration:

```xml
<plugin>
    <artifactId>maven-dependency-plugin</artifactId>
    <version>2.6</version>
    <executions>
        <execution>
            <id>copy-payara-micro</id>
            <phase>package</phase>
            <goals>
                <goal>copy</goal>
            </goals>
            <configuration>
                <outputDirectory>${project.build.directory}</outputDirectory>
                <stripVersion>true</stripVersion>
                <silent>true</silent>
                <artifactItems>
                    <artifactItem>
                        <groupId>fish.payara.extras</groupId>
                        <artifactId>payara-micro</artifactId>
                        <type>jar</type>
                    </artifactItem>
                </artifactItems>
            </configuration>
        </execution>
    </executions>
</plugin>

<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>exec-maven-plugin</artifactId>
    <version>1.6.0</version>
    <executions>
        <execution>
            <goals>
                <goal>exec</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <executable>java</executable>
        <arguments>
            <argument>-jar</argument>
            <argument>${project.build.directory}/payara-micro.jar</argument>
            <argument>--deploy</argument>
            <argument>${project.build.directory}/${project.build.finalName}.war</argument>
        </arguments>
    </configuration>
</plugin>
```
Since: 4.1.1.171

## Build a Payara Micro uber JAR using Maven

The `exec` goal of the Maven Exec plugin can also be used to build an executable uber JAR. The configuration is the same as to execute the WAR artifact, but we need to add the `--outputUberJar` argument to build an uber JAR instead of running the application. An uber JAR can be built using `mvn package` command with the following Exec plugin configuration:

```xml
<plugin>
    <artifactId>maven-dependency-plugin</artifactId>
    <version>2.6</version>
    <executions>
        <execution>
            <id>copy-payara-micro</id>
            <phase>package</phase>
            <goals>
                <goal>copy</goal>
            </goals>
            <configuration>
                <outputDirectory>${project.build.directory}</outputDirectory>
                <stripVersion>true</stripVersion>
                <silent>true</silent>
                <artifactItems>
                    <artifactItem>
                        <groupId>fish.payara.extras</groupId>
                        <artifactId>payara-micro</artifactId>
                        <type>jar</type>
                    </artifactItem>
                </artifactItems>
            </configuration>
        </execution>
    </executions>
</plugin>


<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>exec-maven-plugin</artifactId>
    <version>1.6.0</version>
    <executions>
        <execution>
            <goals>
                <goal>exec</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <executable>java</executable>
        <arguments>
            <argument>-jar</argument>
            <argument>${project.build.directory}/payara-micro.jar</argument>
            <argument>--deploy</argument>
            <argument>${project.build.directory}/${project.build.finalName}.war</argument>
            <argument>--outputUberJar</argument>
            <argument>${project.build.directory}/${project.build.finalName}.jar</argument>        </arguments>
    </configuration>
</plugin>
```
