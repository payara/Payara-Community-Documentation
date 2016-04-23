![Payara Logo](payara-logo-blue.png)

## Welcome to the Payara wiki Build Instructions Page!
This page provides instructions on how to build the Payara source code.

## Prerequisites
To build and run Payara, your environment must be set up with the following:

* Oracle JDK 7 Update 65 or later, or Oracle JDK 8 Update 20 or later.
* Maven 3.0.3 or above
* Git
* A JAVA_HOME environment variable pointing to the JDK install location (e.g. /home/user/jdk11.8.0_45/)
* A PATH environment variable that has a pointer to the Java binaries (JAVA_HOME/bin)

You can also optionally add the Maven _bin_ folder to the PATH environment variable as well, and the documentation will assume that you have done so.

## Configuring Maven
If using JDK 7, you will need to increase the heap size and PermGen size to prevent the build process from running out of memory.

Create a MAVEN_OPTS environment variable and set it as:

```Shell
-Xmx1024m -XX:MaxPermSize=512m 
```

If using JDK 8, PermGen has been replaced by Metaspace, which can increse its maximum size on its own, so you only need to increase the heap size:

```Shell
-Xmx1024m
```

## Getting the Source Code
To download the Payara source code, open a terminal or Git Bash window, navigate to the directory you would like the source code to be downloaded to, and run `git clone https://github.com/payara/Payara.git`.

This will download the Payara source code, and initialise git, in a directory called _Payara_.

## Building Payara

With your Git Bash or terminal window, navigate into the downloaded _Payara_ directory, and run:

```Shell
mvn clean install
```

This will build Payara and run the integrated GlassFish unit tests. To save a bit of time, you can skip these tests by appending the _skipTests_ flag to the install command like so:

```Shell
mvn clean install -DskipTests
```

## Building Payara Micro

To save some time on the main build Payara Micro is not automatically built from the top level maven project. To build Payara Micro you must previously build the full Payara as described above. Once that has been built

```Shell
cd appserver/extras/embedded/payara-micro
mvn clean install -DskipTests
```

After the build has completed the Payara Micro jar is in the target directory.