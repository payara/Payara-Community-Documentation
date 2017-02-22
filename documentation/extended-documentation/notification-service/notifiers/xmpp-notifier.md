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









