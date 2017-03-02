# Overview
Starting with release 4.1.1.162, phone home data is used to learn about the usage of Payara Server.  
This is part of work towards an automated Payara Server update facility.  

Domains call our phone home server when they are started and then once again each day.  


# Documentation Conventions
_${Product-Root}_ - This is the root of the Payara server directory, referring to where you have Payara installed.  
_${Domain}_ - This refers to the name of your Payara domain.  
`...` - Denotes a skipping of unrelated code that would be present in the actual file or program.  


# What information is sent?

The following information is sent in each phone home call:  

* Payara Server version  
* Java Virtual Machine version  
* Domain uptime  
* Number of nodes in the domain  
* Number of instances in the domain  


# Phone Home Source Code

The phone home code is Open Source and available to view [here][1].  


# Disabling Phone Home

By default, Phone Home activity is enabled.  

It may be disabled by any of the following methods:  

* [Removing the service file](#5.1-disable-phone-phone-by-removing-the-service-file)  
* [Through a command line _asadmin_ command](#5.2-disable-phone-home-using-asadmin)  
* [Editing the _domain.xml_ file](#5.3-disable-phone-home-in-the-domainxml-file)  

## Disable Phone Home by removing the service file

* Navigate to the _${Product-Root}/glassfish/modules_ directory.  
* Delete _phonehome-bootstrap.jar_.  

## Disable Phone Home using Asadmin

The command requires the Admin Server to be running, and will expect it to be listening on port 4848 unless specified differently with the _--port_ asadmin utility option.  

`asadmin disable-phone-home`  

This command will also update the _domain.xml_ with the change described below.  

## Disable Phone Home in the domain.xml file

* Open up the _domain.xml_ file in your text editor of choice, it can be found under _${Product_Root}/glassfish/domains/${Domain}/config/_  
* Find the `<config name="server-config">` tag  
* Add the tag `<phone-home-runtime-configuration enabled="false"/>`  


# Phone Home URL

Phone Home messages are sent to:  

[http://www.payara.fish/phonehome][2]  

[1]: https://github.com/payara/Payara/blob/master/nucleus/payara-modules/phonehome-bootstrap/src/main/java/fish/payara/nucleus/phonehome/PhoneHomeTask.java "Source Code"
[2]: http://www.payara.fish/phonehome "http://www.payara.fish/phonehome"
