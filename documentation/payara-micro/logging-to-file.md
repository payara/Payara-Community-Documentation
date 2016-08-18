# Logging to a file
This section describes how to print all the Payara Micro log messages into a file.

## Logging to a file from the Command Line

To print all of the Payara Micro log messages into a file from the command line, you will need to use the `--logToFile` option, 
followed by either a path to where you want to put the log file or by giving the name of a file you want to print the logs into. 
If a file name is not given, a default file called payara-server.log is generated. 

```shell
java -jar payara-micro.jar --logToFile /home/user/PayaraMicro.log
```

## Logging to a file Programmatically

To print all the Payara Micro log messages into a file programmatically, you will need to use `setUserLogFile(String filePath)` method. 

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
         PayaraMicro.getInstance().setUserLogFile("/home/user/PayaraMicro.log").bootStrap();
    }
}
```

