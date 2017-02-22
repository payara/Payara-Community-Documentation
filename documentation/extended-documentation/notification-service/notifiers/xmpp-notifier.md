# XMPP Notifier

The **Ex**tensible **M**essaging and **P**resence **P**rotocol is a communication protocol used by messaging applications based on XML notation, focused through the exchange of structured messages across services and devices on multiple network arrangements. XMPP \(formerly known as Jabber\) is an open standard, which means that anyone can implement their own toolset to send and receive messages.

## XMPP Server Configuration

XMPP works using a client server architecture, akin to other messaging solutions like Hipchat, Slack or IRC for example. Unlike those, XMPP is decentralized, which means that any person or organization can run its own server using a propietary domain. There are multiple server implementations in the market, with both open source and commercial offerings like these:

* [Apache Vysper](https://mina.apache.org/vysper-project) \(Open Source\)
* [Oracle Communications Instant Messaging Server](https://www.oracle.com/industries/communications/enterprise/products/instant-messaging/index.html) \(Commercial\)
* [OpenFire ](http://igniterealtime.org/projects/openfire/index.jsp)\(Open Source\)
* [CommuniGate Pro](https://www.communigate.com/default.html) \(Commercial\)
* [Jabberd 2](http://jabberd2.org/) \(Open Source\)

No matter what XMPP server you choose or are using, the Payara Server Notifier will be able to communicate to it and send notifications to a specific room. The following are the requirements needed to be fullfilled by your server's configuration to guarantee that the notifier works correctly:

* Configure the XMPP server with a valid domain's name/ FQDN
* If considering secure communication, the XMPP server must have a valid SSL certificate configured for its FQDN
* Configure the service for text-based conferencing \(this service is usually named **conference** and its a subdomain of the XMPP server\)
* Create room that will be used to receive the notifications sent by Payara Server.
* Create an user that is allowed to access the room created and post messages on it.

We will use OpenFire to illustrate how to correctly configure these requirements. If you are using a different server, check its documentation and follow the instructions on how to implement these similar tasks.

### OpenFire Configuration

Proceed to download and install the OpenFire server by following the instructions detailed here. Once the server is installed, start the service and head to the server's admin console at `http://{domain}:9090/`

Since the server was recently installed it will finish its bootstrapping. Select the language that will be used by the administration interface:

Now, proceed to configure the domain name and FQDN of your server. You can also alter the ports for the admin console and configure secure access using property encryption if necessary. 

To use OpenFire on production environments, its recommended to install an external database that will be used to store its configuration and data. For the sake of simplicity, we will choose to use and embedded database:

Configure the user store that will be used by the server. Generally speaking, is not uncommon that an organization uses an LDAP server to store profiles so that option is still available. As with the previous configuration we will use the simpler option:

Finally, configure the credentials for the **admin** user:

With the server installation complete, login to the admin console with the credentials we just provided:

Now we need to create the user that will be used to post the notifications on the room. Select the **User/Groups** option in the top menu:

Click on the **Create New User** option in the sidebar. Input the information for this new user \(**Username**, **Name** and **Password** are required\):

With the user created, we will proceed to create the room used to display notifications. Select the **Group Chat** option in the top menu:

Now, click on the Create New Room option in the sidebar. Be sure to input the room's **ID**, **Name** and **Description** as requested:

Check that the room was created successfully. Click on the room's link to enter its details. Take special note of the Service Name, which will be used to configure the notifier later:

Finally, select the Permissions option in the sidebar and add the user we created earlier in the **Room Occupants** section. You can do this by searching using its JID/username in the search box:

With this, the XMPP server's configuration is finished.

## Payara Server Configuration

With the XMPP server properly configured, now it's time to setup the _Notification Service_ in the domain configuration. As usual you can do this using the administration web console, from the command line or editing the _domain.xml_ configuration file directly.

The configuration settings required by the service are the following:

* _Server's Location_: _Hostname_ and _Port_ where the XMPP is listening for requests. The hostname is required, the port defaults to 5222 if not provided.
* _Service name_: Used by the service to manage group chat sessions, always required.
* _Room ID_: The ID of the room that will be used to host the notification events, always required.  
* _Credentials_: The _Username_ and _Password_ of the user that will post notification events in the room.

You can also configure an option whether or not to disable security transport (SSL) when establishing communication to the server. The default value for this setting is `false`.

### Using the Administration Web Console

To configure the Notification Service in the Administration Console, go to _Configuration -&gt; \[instance-configuration \(like server-config\)\] -&gt; Notification Service_ and click on the **XMPP** tab:



Check the **Enabled** box \(and the **Dynamic** box too if you don't want to restart the domain\) and input the required information.

**NOTE**: The room's ID is incorrectly labeled as Room Name, so be sure to input the room's ID instead.  

Hit the **Save** button to preserve the changes.

### From the Command Line

To configure the Notification Service from the command line, use the `notification-xmpp-configure` asadmin command, specifying the configuration options like this:

```
asadmin > notification-xmpp-configure --enabled=true --dynamic=true --hostname="172.28.128.3" --port="5222" --username="payara_notifier" --password="******" --securityDisabled=false --roomname=server
```

You can use the `--enabled` and `--dynamic` options to enable/disable the XMPP notifier on demand.

Also, you can retrieve the current configuration for the XMPP notifier using the `get-xmpp-notifier-configuration` asadmin command like this:

```
asadmin > get-xmpp-notifier-configuration

Enabled  Host          Port  Service Name            Username         Password  Security Disabled  Room Name
true     172.28.128.3  5222  conference.payara.fish  payara_notifier  payara    true               server
```

### On the _domain.xml_ configuration file

To configure the Notification Service in the _domain.xml_ configuration file, locate the `notification-service-configuration element` in the tree and insert the `xmpp-notifier-configuration` with the respective configuration attributes like this:

```
<notification-service-configuration enabled="true">
    <xmpp-notifier-configuration room-name="server" service-name="conference.payara.fish" password="******" security-disabled="true" host="172.28.128.3" username="payara_notifier"></xmpp-notifier-configuration>
</notification-service-configuration>
```

## Troubleshooting

When you have correctly configured the XMPP notifier, it can be used to push notifications to your configured server. You can visualize the messages in a XMPP client of your choice. If you do not see any notification event messages in the client, check the following:

* Is the XMPP notifier enabled?
* Is the Notification Service itself enabled?
* Is there a service configured to use the notifier? \(e.g. the HealthCheck service\)
* Is the service configured to send notifications frequently enough to observe?
* Have you enabled the service after configuring it?
* Is the XMPP server correctly configured?
* Is there a firewall between both servers that is correctly configured to allow sending messages in the respective port?
* Are the room permissions configured correctly?
* If using secure transport, was the server configured with a valid SSL certificate for the domain's name?

Here's a sample of how the notifications are visualized on a chat room using the [Spark](https://www.igniterealtime.org/projects/spark/) XMPP client:










