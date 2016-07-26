# Deploying an Application Programmatically during Bootstrap

There are two methods you can use to deploy an application during the bootstrapping process: `addDeployment(String pathToWar)`, and `addDeploymentFile(File file)`.

The first, `addDeployment(String pathToWar)`, accepts a String that points to the path of the file to be deployed. For example:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro.getInstance().addDeployment("/home/user/example.war").bootStrap();
    }
}
```

The second method, `addDeploymentFile(File file)`, functions in the same way as the `addDeployment(String pathToWar)` method, but takes a File object as its parameter instead:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File file = new File("/home/user/example.war");
        PayaraMicro.getInstance().addDeploymentFile(file).bootStrap();
    }
}
```

Unlike when controlling Payara Micro from the command line, you can split the instance initialisation and configuration across multiple lines methods. For example, to deploy an application on one line, and start the instance on another:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.addDeployment("/home/user/example.war");
        micro.bootStrap();
    }
}
```

## Deploying Multiple Applications Programmatically during Bootstrap
Similar to when deploying multiple applications from the command line, you must use call the `addDeployment` or `addDeploymentFile` method for each application you wish to deploy.

For example, to deploy three applications:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        PayaraMicro micro = PayaraMicro.getInstance();
        
        micro.addDeployment("/home/user/example.war");
        micro.addDeployment("/home/user/test.war");
        micro.addDeployment("/home/user/three.war");
        
        micro.bootStrap();
    }
}
```

Alternatively, you can use the programmatic equivalent of the `--deploymentDir` command line option (described in [section 4.1.1](#411-deploying-multiple-applications-from-the-command-line)): the `setDeploymentDir(File deploymentRoot)` method:

```Java
import fish.payara.micro.BootstrapException;
import fish.payara.micro.PayaraMicro;
import java.io.File;

public class EmbeddedPayara 
{
    public static void main(String[] args) throws BootstrapException 
    {
        File deployments = new File("/home/user/deployments/");
        PayaraMicro micro = PayaraMicro.getInstance();
        micro.setDeploymentDir(deployments);
        micro.bootStrap();
    }
}
```

