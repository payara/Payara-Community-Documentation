# Deploying an Application Programmatically to a Bootstrapped Instance

There are three methods available for deploying an application to a bootstrapped instance: 

   * `deploy(File war)`
   * `deploy(String name, InputStream is)`
   * `deploy(String name, String contextRoot, InputStream is)`

### `deploy(File war)`
The first method works in the same way as the `addDeploymentFile` method described in the section [Deploying Programmatically during Bootstrap](deploy-program-bootstrap.md).

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File war = new File("/home/user/deployments/");
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        instance.deploy(war);
    }
}
```

### `deploy(String name, InputStream is)`
This method allows you to deploy WARs from an InputStream:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        
        try (InputStream is = new FileInputStream("/home/user/test.war"))
        {        
            instance.deploy("test", is);
        }
        
        catch (IOException ex)
        {
            Logger.getLogger(EmbeddedPayara.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
```

### `deploy(String name, String contextRoot, InputStream is)`
This method works in the same way as the previous method, but allows you to specify the context root of the application. The following example would deploy the _test_ application to a context root of _/app_:

```Java
import fish.payara.micro.PayaraMicro;
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicroRuntime;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicroRuntime instance = PayaraMicro.bootstrap();
        
        try (InputStream is = new FileInputStream("/home/user/test.war"))
        {        
            instance.deploy("test", "app", is);
        }
        
        catch (IOException ex)
        {
            Logger.getLogger(EmbeddedPayara.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
```

