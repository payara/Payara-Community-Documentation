# Payara Server Administration and Monitoring API


<a name="overview"></a>
## Overview
This API allows an user to interact with a Payara Server's domain, emulating the execution of the commonly used asadmin commands. This API allows an user to execute the following tasks:

* Execute administration commands to modify the domain's configuration.
* Retrieve monitoring statistics
* Look at the domain's log entries.

To change the configuration of the domain, it is really necessary to understand how the configuration resources are organized in a tree model. To interact with a resouce, it is recommended to first call the `GET` method of the `  /management/domain/{resource}` endpoint to understand what operations are supported and other details (parameters, subcommands, etc.) 

In order to succesfully consume the endpoints in this API, it must be taken into consideration if the domain's access is already secured. If so, then one of the 2 decribed security schemes must be used.


### Version information
*Version* : 1.0.0


### URI scheme
*BasePath* : /  
*Schemes* : HTTP, HTTPS


### Tags

* configuration : Used for domain configuration operations
* logging : Used for domain logging purposes
* monitoring : Used for monitoring operations
* sessions : Used for session management



