# Running Asadmin Commands on Micro from a Domain Administration Server

Asadmin commands can be sent from the Domain Administration Server \(DAS\) to micro instances that are running within the same cluster as the DAS server. This can be achieved either using the admin console or from the command line.

## Sending Asadmin Commands using the Admin Console

To send asadmin commands using the Domain Administration Server you must first ensure that the DAS itself is within the same Hazelcast cluster as the micro instances. Hazelcast can be enabled for the DAS on the Domain tab, under Hazelcast:

![Enable Hazelcast](/assets/enable-hazelcast-on-das.png)

From here, selecting the "_Cluster Members_" tab brings up the instances within the cluster. At the bottom of the page, you will find a table filled with the Payara Micro instances:

![Micro Instances on DAS](/assets/micro-instances-on-das.png)

To send an asadmin command:

1. Select the recipient nodes
2. Enter the asadmin command in the textbox
3. Press **Send Asadmin Command**

![Send commands from DAS](/assets/sending-asadmin-command-from-the-das-to-micro.png)

## Sending Asadmin Commands from the Command Line

To send asadmin commands using the command line there is a new asadmin command for the Domain Administation Server - `send-asadmin-command`. The asadmin command is entered using the `--command` option, which only accepts a single command as an input \(including said commands own arguments\).

As an example of sending a command via asadmin:

```Shell
asadmin send-asadmin-command --command deploy /home/user/application --contextRoot=/example
```


