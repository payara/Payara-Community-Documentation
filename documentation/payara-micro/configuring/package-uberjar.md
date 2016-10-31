# Packaging a Configured Instance as an Uber Jar
Sometimes it is preferable to package the application, configuration and dependencies into a single executable jar. To do this with Payara Micro use the `--outputUberJar` command line option for example:

```shell
java -jar payara-micro.jar --deploy test.war --outputUberJar test.jar
```

this will package up the payara-micro.jar and the war file into a single jar. The resulting jar will then be runnable with:

```shell
java -jar test.jar
```

Any additional command line options you specify when creating an uber jar are recorded and retained when you run the uber jar with no parameters. For example

```shell
java -jar payara-micro.jar --deploy test.war --port 9080 --lite --clusterName test-cluster --clusterPassword test-password --outputUberJar test2.jar
```

All the command line options for port etc. will be retained when the uber jar is ran with no parameters.


### Uber JAR Context Root
When creating an Uber JAR, the context root of the packaged application will **always** be the name of the WAR that is deployed. For example, the `test.war` that was packaged into the `test2.jar` on port 9080 would be accessible on the following path:

```
http://localhost:9080/test
```

Currently, this is **always** the case; including when a context root is specified in a `glassfish-web.xml` deployment descriptor.

If the WAR file is renamed to `ROOT.war` and packaged as an Uber JAR, it will be deployed to the root context:

```shell
java -jar payara-micro.jar --deploy ROOT.war --port 9080 --outputUberJar test3.jar
java -jar test3.jar
```

The application will now be accessible on:
```
http://localhost:9080/
```
