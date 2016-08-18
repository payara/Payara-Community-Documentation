# Packaging a Configured Instance as an Uber Jar
Sometimes it is preferable to package the application, configuration and dependencies into a single executable jar. To do this with Payara Micro use the `--outputUberJar` command line option for example;

```shell
java -jar payara-micro.jar --deploy test.war --outputUberJar test.jar
```

this will package up the payara-micro.jar and the war file into a single jar. this jar will then be able to be run with;

```shell
java -jar test.jar
```

Any additional command line options you specify when creating an uber jar are recorded and retained when you run the uber jar with no parameters. For example

```shell
java -jar payara-micro.jar --deploy test.war --port 9080 --lite --clusterName test-cluster --clusterPassword test-password --outputUberJar test2.jar
```

All the command line option for port etc. will be retained when the uber jar is ran with no parameters.

