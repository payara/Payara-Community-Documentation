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

`${payara.version}` is a maven property, which specifies the version of the maven artifact, e.g. {{ book.currentVersion }}.

## Run Payara Micro using Maven

It is possible to run Payara Micro using the `java` goal of the Maven Exec plugin. The main class to execute is `fish.payara.micro.PayaraMicro`. For example, in order to build and execute the maven WAR artifact in Payara Micro, you can issue the `mvn package` command with the following Exec plugin configuration:

```
<plugin>
  <groupId>org.codehaus.mojo</groupId>
  <artifactId>exec-maven-plugin</artifactId>
  <dependencies>
      <dependency>
          <groupId>fish.payara.extras</groupId>
          <artifactId>payara-micro</artifactId>
          <version>${payara.version}</version>
      </dependency>
  </dependencies>
  <executions>
      <execution>
          <id>payara-run</id>
          <phase>package</phase>
          <goals>
              <goal>java</goal>
          </goals>
          <configuration>
              <mainClass>fish.payara.micro.PayaraMicro</mainClass>
              <arguments>
                  <argument>--deploy</argument>
                  <argument>${basedir}/target/${project.build.finalName}.war</argument>
              </arguments>
              <includeProjectDependencies>false</includeProjectDependencies>
              <includePluginDependencies>true</includePluginDependencies>
              <executableDependency>
                  <groupId>fish.payara.extras</groupId>
                  <artifactId>payara-micro</artifactId>
              </executableDependency>
          </configuration>
      </execution>
  </executions>
</plugin>
```

## Build a Payara Micro uber JAR using Maven

The `java` goal of the Maven Exec plugin can also be used to build an executable uber JAR. The configuration is the same as to execute the WAR artifact, but we need to add the `--outputUberJar` argument to build an uber JAR instead of running the application. An uber JAR can be built using `mvn package` command with the following Exec plugin configuration:

```
<plugin>
  <groupId>org.codehaus.mojo</groupId>
  <artifactId>exec-maven-plugin</artifactId>
  <dependencies>
      <dependency>
          <groupId>fish.payara.extras</groupId>
          <artifactId>payara-micro</artifactId>
          <version>${payara.version}</version>
      </dependency>
  </dependencies>
  <executions>
      <execution>
          <id>payara-run</id>
          <phase>package</phase>
          <goals>
              <goal>java</goal>
          </goals>
          <configuration>
              <mainClass>fish.payara.micro.PayaraMicro</mainClass>
              <arguments>
                  <argument>--deploy</argument>
                  <argument>${basedir}/target/${project.build.finalName}.war</argument>
                  <argument>--outputUberJar</argument>
                  <argument>${basedir}/target/${project.build.finalName}.jar</argument>
              </arguments>
              <includeProjectDependencies>false</includeProjectDependencies>
              <includePluginDependencies>true</includePluginDependencies>
              <executableDependency>
                  <groupId>fish.payara.extras</groupId>
                  <artifactId>payara-micro</artifactId>
              </executableDependency>
          </configuration>
      </execution>
  </executions>
</plugin>
```



