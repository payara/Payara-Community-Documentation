#Healthcheck Service
_Payara Server and Micro 161 (4.1.1.161) onwards_

In the 161 release we also have the new Healthcheck Service. Payara Server now periodically checks;

*     Host CPU Usage
*     Host Memory Usage
*     Payara Server’s JVM Garbage Collections
*     Payara Server’s JVM Heap Usage
*     CPU Usage of individual threads

If there is a problem with any of these metrics and they exceed a configurable threshold then a Warning, Error or Critical message is logged to the server’s log file. Again enabling operations teams to rapidly detect problems or work out what happened after problems have occurred.

For more details and configuration see the pages below.

[Healthcheck Service Configuration] (Health-Check-Services-Configuration-(Payara-4.1.1.161))

[Healthcheck asadmin commands](Health-Check-Services-Admin-Commands-(Payara-4.1.1.161))