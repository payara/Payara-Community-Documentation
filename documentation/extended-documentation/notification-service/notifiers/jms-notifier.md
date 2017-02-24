# JMS Notifier
The Java Message Service (JMS) API is a messaging API which can be used to enable asynchronous communication between clients. The Payara JMS notifier makes use of a JMS queue to send notification events from services such as Request Tracing and Health Check. These can then be consumed by a custom MDB or other JMS compatible client.

## Requirements

1. **A JMS broker**<br />_Payara Server ships with embedded OpenMQ_
2. **Payara Server Full edition**<br />_The Web edition does not come with native JMS capabilities_

## Configuration

1. Create a new JMS queue to receive the notification messages from the notifier:
  ![](/assets/edit-jms-destination.png)

  To make this change via the asadmin tool, use the following command which mirrors the above screenshot:

  ```Shell
  asadmin create-jms-resource --enabled=true --property=Name=notifierQueue --restype=javax.jms.queue jms/notifierQueue
  ```

2. Set the properties for the JMS Notifier:
![](/assets/jms-notifier-configuration.png)
The above example uses the embedded OpenMQ broker provided in Payara Server Full. No further configuration is needed to use it other than creating the queue.

  To make this change via the asadmin tool, use the following command which mirrors the above screenshot:

  ```Shell
  asadmin notification-jms-configure --dynamic=true --enabled=true --contextFactoryClass=com.sun.enterprise.naming.SerialInitContextFactory --target=server-config --queueName=notifierQueue --url=localhost:7676 --connectionFactoryName=jms/_defaultConnectionFactory
  ```

3. Next, enable a service to push data through the notifier. For example, the HealthCheck service's CPU metric can be configured to push CPU metrics to a notifier every 5 seconds.

4. To Consume Messages using JMS 2.0:
```Java
@MessageDriven(activationConfig = {
    @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/notifierQueue"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
    @ActivationConfigProperty(propertyName = "destination", propertyValue = "notifierQueue"),
})
public class NotificationConsumer implements MessageListener {

    @Override
    public void onMessage(Message message) {
        try {
            System.out.println("Message received: " + message.getBody(String.class));
        } catch (JMSException ex) { // ignore }
    }
}
```

5. View the result of the MessageDrivenBean's `onMessage()` command. In this example, the CPU metric of the healthcheck service was configured to notify every 5 seconds, so the result of simply printing to `System.out` is log messages similar to the following:

```Shell
[2017-02-24T14:25:02.019+0000] [Payara 4.1] [INFO] [] [fish.payara.nucleus.healthcheck.HealthCheckService] [tid: _ThreadID=151 _ThreadName=admin-thread-pool::admin-listener(9)] [timeMillis: 1487946302019] [levelValue: 800] [[
  Scheduling Health Check for task: CPUC]]

[2017-02-24T14:25:02.019+0000] [Payara 4.1] [INFO] [] [fish.payara.nucleus.healthcheck.HealthCheckService] [tid: _ThreadID=151 _ThreadName=admin-thread-pool::admin-listener(9)] [timeMillis: 1487946302019] [levelValue: 800] [[
  Payara Health Check Service Started.]]

[2017-02-24T14:25:02.376+0000] [Payara 4.1] [INFO] [] [] [tid: _ThreadID=48 _ThreadName=p: thread-pool-1; w: 3] [timeMillis: 1487946302376] [levelValue: 800] [[
  Message received: Health Check notification with severity level: INFO. (host:mike-payara, server:server, domain:domain1,instance:server)
CPUC:Health Check Result:[[status=GOOD, message='CPU%: 1.45, Time CPU used: 3 seconds 797 milliseconds'']']]]

[2017-02-24T14:25:02.380+0000] [Payara 4.1] [INFO] [] [] [tid: _ThreadID=50 _ThreadName=p: thread-pool-1; w: 5] [timeMillis: 1487946302380] [levelValue: 800] [[
  Message received: Health Check notification with severity level: SEVERE. (host:mike-payara, server:server, domain:domain1,instance:server)
CPUC:Health Check Result:[[status=CRITICAL, message='CPU%: 109.71, Time CPU used: 7 milliseconds'']']]]
```

### Getting Configuration
To get the current JMS notifier configuration using asadmin, run the command:

```Shell
asadmin get-jms-notifier-configuration
```

This will return the details of the current JMS notifier configuation; see below for an example:

```Shell
Enabled     Context Factory Class                               Connection Factory Name        Queue Name     URL                  Username    Password
true        com.sun.enterprise.naming.SerialInitContextFactory  jms/_defaultConnectionFactory  notifierQueue  localhost:7676
```
