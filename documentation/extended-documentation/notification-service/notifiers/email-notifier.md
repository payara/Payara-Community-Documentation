# Email Notifier

Payara Server is now able to direct notifications from the [Notification service](/documentation/extended-documentation/notification-service/notification-service.md) to a single given email address.

## Requirements
To use an email address as a notification target you must have a valid email address, and the SMTP address and valid access credentials for your email host.

## Configuration
At a high level, the steps to configure the email notifier are:

1. Create a JavaMail Session
1. Create the notifier via the asadmin command or the Admin Console.

### Email Notifier Configuration
If you don't already have a JavaMail session set up, you will need one to send the notifications. Instructions on setting up a JavaMail session can be found [in the core documentation](/documentation/core-documentation/javamail.md).

The email notifier is enabled from the Notification tab of your instance configuration. Here the jndiName of the JavaMail session and the intended address are entered. The email notifier supports a single email address.

  ![](/assets/admin-console-email-notifier-configuration-2.png)

The same configuration can be set using an asadmin command, as shown below:

````Shell
asadmin notification-email-configure --jndiName=emailNotifier --to=notifications@payara.fish --enabled=true --dynamic=true
````

To check the currently applied configuration from asadmin, run the command:
```Shell
asadmin get-email-notifier-configuration
```

This will return the current configuration, whether it is enabled, the "to" address, and the JNDI name of the JavaMail session in use.

As an example output:

```Shell
$ asadmin get-email-notifier-configuration
Enabled  JNDI Name                  To
true     mail/exampleEmailNotifier  example@example.com
```
