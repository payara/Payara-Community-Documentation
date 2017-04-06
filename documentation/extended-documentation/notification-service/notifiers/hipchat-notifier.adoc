# HipChat Notifier
HipChat is a team chat application created by Atlassian. It can be used for teams to discuss topics in separate "rooms", but also supports integrations from services to notify users of events.

Payara Server has now included functionality to send notifications from the [Notification service](/documentation/extended-documentation/notification-service/notification-service.md) to a HipChat room


## Requirements
To use HipChat as a notification target you must have a HipChat account and a room where notifications will be sent.

## Configuration
At a high level, the steps to configure the HipChat notifier are:

1. In HipChat, create a new notification token for the required room
- Create the notifier using the `asadmin` command

#### HipChat Configuration
Assuming you already have a HipChat account, the steps to create a room and generate a notification token are as follows:

1. Create a new room in HipChat where your notifications will be sent, if one does not exist. The example below shows the creation of a room called "*payara-notifications*"   

  ![](/assets/hipchat-create-room.png)
- After you have created the target room, or if a room already exists, visit `https://${your-team-name}.hipchat.com/rooms` and search for the room name to filter out any others, as shown below:

  ![](/assets/hipchat-view-room.png)

- Next, select your room and select the "**Tokens**" link in the left-hand menu to add a new notification token:

  ![](/assets/hipchat-room-tokens.png)

- Finally, give your token an informative label, since this will be displayed in your room when notifications are received:

  ![](/assets/hipchat-create-token.png)


#### Payara Server Configuration
Once you have a token, the configuration of the notifier within Payara Server involves just one step. In the Admin Console, simply add the room name and token to the appropriate fields, as shown below:
![](/assets/admin-console-hipchat-notifier-configuration.png)

Make sure that the "Enabled" box is ticked so that the notifier will be used. If you would like the changes to take effect without needing a restart, tick the "Dynamic" box as well.

To make these changes via the asadmin tool, use the following command, which mirrors the above screenshot:

```
asadmin> notification-hipchat-configure --enabled=true --roomName="payara-notifications" --token="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" --dynamic=true
```

To check the current applied configuration from asadmin, run the command:
```Shell
asadmin get-hipchat-notifier-configuration
```

This will return the current configuration, with whether it is currently enabled, the room name, and the token in use:

```Shell
$ asadmin get-hipchat-notifier-configuration
Enabled         Room Name                 Token
true            payara-notifications      xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

#### Troubleshooting
When you have correctly configured the HipChat notifier, it can be used to push notifications to your configured room. If you do not see any notifications, check the following:

* Is the HipChat notifier enabled?
* Is the notification service itself enabled?
* Is there a service configured to use the notifier? (e.g. the HealthCheck service)
* Is the service configured to send notifications frequently enough to observe?
* Have you enabled the service after configuring it?
* Check that you have not hit the [rate limit for the HipChat API](https://developer.atlassian.com/hipchat/guide/hipchat-rest-api/api-rate-limits)

Once configuring is complete and both the notification service and the service you are using are enabled, you should see output like the example, which shows the Healthcheck service outputting CPU information every 3 seconds:



![](/assets/hipchat-notifications.png)
.
