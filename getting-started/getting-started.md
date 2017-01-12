# Contents

* [1. Overview](#1-overview)
* [2. Downloading Payara Server](#2-downloading-payara-server)
* [3. Starting Payara Server](#3-starting-payara-server)
* [4. Accessing the Administration Console](#4-accessing-the-administration-console)
* [5. Deploying an Application](#5-deploying-an-application)
  * [5.1 Deploying using Asadmin](#51--deploying-using-asadmin)
  * [5.2 Deploying using Administration console](#52--deploying-using-administration-console)

# 1. Overview

This page covers how to download Payara Server, start Payara Server, access the Administration Console, deploy an application and how to access the deployed application.

# 2. Downloading Payara Server

Payara Server can be downloaded from \([http://www.payara.fish/downloads](http://www.payara.fish/downloads)\).  
Download to a directory of your choosing and then unzip. On Linux based systems you can use the following command:

# 3. Starting Payara Server

To start Payara Server, execute the following command:

`$ Payara_installed_directory/bin/asadmin start-domain`

This will start domain1, which is the default domain included with Payara Server. If you wanted to start a different domain, the domain name would need to be specified. An example can be seen below:

`$ asadmin start-domain your_domain_name`

# 4. Accessing the Administration Console

Once the server is up and running, type this URL `http://localhost:4848` in your browser to access the Administration Console. This is the default URL for accessing the Administration Console.

# 5. Deploying an Application

In order for a web application to run, it must be first deployed on an application server such as Payara Server.

## 5.1    Deploying using Asadmin

To deploy a WAR file, you need to use the `deploy option`, followed by the path to the application to deploy. See below for an example of deploying a WAR file:

`$ Payara_installed_directory/bin/asadmin deploy your_application.war`

## 5.2    Deploying using Administration console

* Access the Administration Console by navigating to [http://localhost:4848](http://localhost:4848) \(make sure a domain is running beforehand\)
* Click on Applications under the heading Common Tasks pane on the left side of the page.
* Any deployed applications are listed here. Since there are none right now, click on Deploy.
* The current display should be the Deploy Applications or Modules page. Select Packaged File to be uploaded to the Server and click browse. Navigate to where your application is located, select the file and click Open. You should be returned to the same page with some settings listed.
* Change any settings if needed otherwise accept the default settings and click ok to be returned to the applications page. Your application should now be listed.
* Finally, under the action tab click launch. The default URL for application is `http://localhost:8080/ your_application`.



