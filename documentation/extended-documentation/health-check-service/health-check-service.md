#Health Check Service
_Payara Server and Micro 161 (4.1.1.162) onwards_

Since the 161 release, Payara includes the Health Check Service. When enabled, Payara Server periodically checks:

*     Host CPU Usage
*     Host Memory Usage
*     Payara Server’s JVM Garbage Collections
*     Payara Server’s JVM Heap Usage
*     CPU Usage of individual threads
*     Detects stuck threads

If there is a problem with any of these metrics and they exceed a configurable threshold then a Warning, Error or Critical message is logged to the server’s log file. Again enabling operations teams to rapidly detect problems or work out what happened after problems have occurred.
