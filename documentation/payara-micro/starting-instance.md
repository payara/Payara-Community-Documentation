# Starting an Instance
This section details the very basics of starting an instance.

## Starting an Instance from the Command Line
To start an instance of Payara Micro from the command line, you simply run the JAR:  

```Shell
java -jar payara-micro.jar
```

This single command is all you need to run Payara Micro instances; additional configuration options are all a part of this command.

## Starting an Instance Programmatically
You need to import two classes from the fish.payara.micro package (contained in the Payara Micro JAR, see section [Maven Support](maven/maven.md) for instructions on importing this JAR with Maven):  

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
```

You can then start an instance with default settings by calling the `bootstrap()` method from the PayaraMicro class. 
This initialisation will throw a _BootstrapException_ exception, so you will need to surround it with a try-catch, or have the parent method throw the exception.

A simple example is as follows:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicro.bootstrap();
    }    
}
```

To start an instance with non-default settings (configuration changes or deploying applications upon startup), you have to call the `getInstance()` method before using `bootstrap()`. More details on this can be found in the [Configuring an Instance Programmatically](configuring/config-program.md) section.
The use of the `getInstance()` method does not exclude you from using the default settings however; calling the `bootstrap()` method on its own (as shown in the example above) is functionally equivalent to calling the `bootstrap()` method directly after the `getInstance()` method, such as in the example below:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicro.getInstance().bootStrap();
    }    
}
```

The `bootStrap()` method returns a `PayaraMicroRuntime` object instance, which is comes with various methods that afford you control over the instance and its cluster after you have bootstrapped it. To take advantage of this, you have to initialise a `PayaraMicroRuntime` object from the `bootStrap` method, like so:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.PayaraMicroRuntime;

public class EmbeddedPayara 
{ 
    public static void main(String[] args) throws BootstrapException
    {   
        PayaraMicroRuntime instance = PayaraMicro.bootStrap();
    }    
}
```
