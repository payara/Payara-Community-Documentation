# Stopping an Instance
This section describes how to shut down a Payara Micro instance.

## 6.1 Stopping an Instance from the Command Line
There is no specific option for shutting down a Payara Micro instance.
The only way to shut down an instance from the command line is to find the process ID of the Payara Micro instance, and send a kill signal to it.

## 6.2 Stopping an Instance Programmatically
To shut down a Payara Micro instance programmatically, you will need to use the `shutdown()` method of the `PayaraMicro` or `PayaraMicroRuntime` class.

The `shutdown()` method of the `PayaraMicro` class must be called on the instance of Payara Micro that you want to shut down, so will realistically only be used on a `PayaraMicro` instance variable:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.bootStrap();
        
        micro.shutdown();
    }
}
```

The `shutdown()` method of the `PayaraMicroRuntime` class is tied to an instance variable, so is used in much the same way:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();

        instance.shutdown();
    }
}
```
