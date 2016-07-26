# Configuring an Instance Programmatically

There are various methods available for configuring a Payara Micro instance programmatically. You can only configure an instance before it is bootstrapped however.

The configuration methods available to you should be detected by your IDE, allowing you to view them using the auto-complete feature common to most popular IDEs. Alternatively, you can consult the [Payara Micro Configuration Methods](#1321-payara-micro-configuration-methods) section in the [Appendices](#13-appendices).

As noted before, in the [Deploying an Application Programmatically](#421-deploying-an-application-programmatically-during-bootstrap) section, you can either call the desired configuration commands on one line during instance initialisation, or on separate lines after creating a `PayaraMicro` variable.

As an example of configuring an instance to use a different HTTP and Cluster start port on one line, see here:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().setHttpPort(2468).setClusterStartPort(5902).bootStrap();
    }
}
```

For the example of the same, but done across multiple lines, see here:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.setHttpPort(2468);
        micro.setClusterStartPort(5902);
        micro.bootStrap();
    }
}
```

It is also possible to configure an instance programmatically by specifying a domain.xml file that is packaged within your application by passing a resource string to the setApplicationDomainXML method. The path in the string will be rsolved using the getResource method of the Thread context class loader. 

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().setApplicationDomainXML("config/domain.xml").bootStrap();
    }
}
```

