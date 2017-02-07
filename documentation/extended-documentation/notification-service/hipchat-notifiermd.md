# HipChat Notifier
HipChat is a team chat application created by Atlassian. It can be used for teams to discuss topics in separate "rooms", but also supports integrations from services to notify users of events.

Payara Server has now included functionality to send notifications from the [notification service](/documentation/extended-documentation/notification-service/notification-service.md) to a HipChat room


## Requirements
To use HipChat as a notification target, you must have a HipChat account already created and a room where notifications will be sent.

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
![](/images/admin-console-hipchat-notifier-configuration.png)

Make sure that the "Enabled" box is ticked so that the notifier will be used. If you would like the changes to take effect without needing a restart, tick the "Dynamic" box as well.

To make these changes via the asadmin tool, use the following command, which mirrors the above screenshot:

```
asadmin> notification-hipchat-configure --enabled=true --roomName="payara-notifications" --token="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" --dynamic=true
```