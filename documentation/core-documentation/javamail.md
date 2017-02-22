# JavaMail
A JavaMail session resource represents a mail session within the JavaMail API.
JavaMail sessions configured here can be referred to by their JNDI name.

## Configuration

### From the Admin Console

JavaMail sessions are added from the `Resources` tab on the left pane of the Admin Console. Select `New` on the `Sessions` table to create a new JavaMail session.

![](/assets/admin-console-javamail-location.png)

In this instance, emails will be sent from the address `example@example.com` using the `SMTP` protocol to send mail, and `IMAP` to store mail. With the current implementation of the JavaMail API there is no alternative transport protocol provided by default, though as an alternative to the default store protocol of `imap`, `pop3` is available. All protocols entered also have their associated protocol class which can be modified; more details on [the JavaMail API can be found on java.net](https://javamail.java.net/nonav/docs/api/overview-summary.html).

Typically, when setting up `SMTP` access three additional properties must be specified in the Additional Properties table: enabling startTLS, enabling authentication, and the password. These allow for extra security when sending emails and will not always be required - check with your email provider for their specific configuration.

The example below shows the configuration of a mail host:

![](/assets/admin-console-javamail-configuration.png)

### From asadmin

JavaMail sessions can be created directly from asadmin using all of the fields available on the asadmin console. Additional Properties (as entered on the table on the Admin Console) are added with the `--property` command-line argument as a series of colon separated key/value pairs.

The command below demonstrates this, using the same configuration as pictured above:

```Shell
asadmin create-javamail-resource --mailhost mail.payara.fish --mailuser payara --fromaddress payara@payara.fish --storeprotocol=imap --storeprotocolclass=com.sun.mail.imap.IMAPStore --transprotocol=smtp --transprotocolclass=com.sun.mail.smtp.SMTPTransport --property mail-smtp-starttls-enable=true:mail-smtp-auth=true:mail-smtp-password=password mail/EmailNotifications
```
