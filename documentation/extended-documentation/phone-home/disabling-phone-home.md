# Disabling Phone Home

The phone home service is enabled by default on starting a Payara Server, Payara Micro, or Payara Microprofile instance.
The phone home service can easily disabled in four ways:

## Disabling phone home by removing the service file
1. Navigate to `${Product-Root}/glassfish/modules`.
1. Delete `phonehome-bootstrap.jar`.

## Disabling Phone Home using asadmin
Asadmin commands require that the Admin Server is running on port 4848, unless specified with the `--port` asadmin function.

1. Run the command below:
  ```Shell
  asadmin disable-phome-home
  ```

1. Restart the server to apply the change. This command updates the domain.xml, and phone home will not be re-enabled.

## Disabling the Phone Home in the domain.xml file

Rather than using the asadmin command to modify the domain.xml, your domain.xml (`${Product-Root}/glassfish/domains/${domain}/config/domain.xml`) can be directly modified. This can also be specifically edited for different server configs and domains, depending on where the tag is added.

1. Open `domain.xml`  with a text editor.
1. Find the tag `<config name="server-config">`
1. Within that tag, add a new line with the tag `<phone-home-runtime-configuration enabled="false"/>`

## Disabling Phone Home on Micro Launch

When starting Payara Micro and Payara MicroProfile, the Phone Home Service can be disabled with the command-line argument "`--disablephonehome`":

```Shell
java -jar payara-micro.jar --disablephonehome
```
