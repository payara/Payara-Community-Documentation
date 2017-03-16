# Email Notifier

Payara Server is now able to direct notifications from the [Notification service](/documentation/extended-documentation/notification-service/notification-service.md) to a single given email address.

## Requirements
A valid JavaMail session.

## Configuration
At a high level, the steps to configure the email notifier are:

1. Create a JavaMail Session
1. Create the notifier via the asadmin command or the Admin Console.

### Email Notifier Configuration
You will need a JavaMail session to send the notifications; instructions on setting up a JavaMail session can be found [in the core documentation](/documentation/core-documentation/javamail.md).

The email notifier is configured in the Email tab of the Notification Section of your instance configuration.

On the Email tab there are four fields:

 * `Enabled` determines whether the notifier should be activated.
 * `Dynamic` sets whether the notifier will be enabled without a restart - `true` enables it immediately, while `false` requires a restart.
 * `jndiName` sets the name of the Java Naming and Directory Interface (JNDI) of the configured JavaMail session.
 * `to` sets the email address which will receive the email notifications. Currently only one `to` address can be specified.



  ![](/assets/admin-console-email-notifier-configuration.png)

The same configuration can be set using an asadmin command, as shown below:

````Shell
asadmin notification-email-configure --jndiName=mail/exampleEmailNotifier --to=notifications@example.com --enabled=true --dynamic=true
````

To check the currently applied configuration from asadmin, run the command:
```Shell
asadmin get-email-notifier-configuration
```

This will return the current configuration of the email notifier in full, including whether it is enabled, the "to" address, and the JNDI name of the JavaMail session in use.

As an example output:

```Shell
$ asadmin get-email-notifier-configuration
Enabled  JNDI Name                  To
true     mail/exampleEmailNotifier  example@example.com
```
