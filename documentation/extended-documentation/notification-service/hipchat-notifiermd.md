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

#### Payara Server Configuration
Once you have a token, the configuration of Payara Server is as follows