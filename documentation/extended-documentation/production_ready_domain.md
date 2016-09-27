# Contents

# 1. Overview

This page details the new production ready domain available in Payara Server 4.1.1.152.
# 2. Documentation Conventions

Any paths listed throughout the documentation will use the Unix/Linux file path structure (forward slashes).

JVM Options are listed in the *key=value* notation (when applicable).
# 3. Production Ready Domain

With Payara Server 4.1.1.152, there is a new domain called **payaradomain** in the *${PAYARA_HOME}/glassfish/domains/* folder of that is fine-tuned to be used in production environments.

The following changes are made for this domain configuration:
## 3.1. JVM Options

The following JVM options are fine tuned:

* *-XX:MaxPermSize=512m* (previously *192m*)
* *-Xmx1024m* (previously *512m*)
* *-server* (previously *client*)
* *-Djdk.tls.rejectClientInitiatedRenegotiation=true*

The following JVM options were removed (OSGi Felix parameters):

* -Dosgi.shell.telnet.port=6666
* -Dosgi.shell.telnet.maxconn=1
* -Dosgi.shell.telnet.ip=127.0.0.1
* -Dgosh.args=--nointeractive
* -Dfelix.fileinstall.poll=5000
* -Dfelix.fileinstall.log.level=2
* -Dfelix.fileinstall.bundles.new.start=true
* -Dfelix.fileinstall.bundles.startTransient=true
* -Dfelix.fileinstall.disableConfigSave=false
* -Dcom.ctc.wstx.returnNullForDefaultNamespace=true
* -Dorg.glassfish.additionalOSGiBundlesToStart=org.apache.felix.shell,org.apache.felix.gogo.runtime,org.apache.felix.gogo.shell,org.apache.felix.gogo.command,org.apache.felix.shell.remote,org.apache.felix.fileinstall

## 3.2. HTTP Connection Pool

The maximum size for the thread pool **http-thread-pool** has been increased from *5* to *50*.
