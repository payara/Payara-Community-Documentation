# Gathered Data

## What information is sent?

All versions of Payara return a limited amount of information about its specific configuration. No sensitive data about your machine or your specific usage of Payara Server is sent to us.

## Gathered fields

|Field|Example|
|---|---|
|Payara Server Version|4.1.1.164 #badassfish|
|Java Virtual Machine Version|1.8.0_121|
|Domain Uptime|36500|
|Number of nodes in the domain|1|
|Number of instances in the domain|2|
|Randomly generated UUID|eaa6fe2c-2388-4aa7-fdcc-288c7b318ddfeaa6ef23-2388-4aa7-8dcc-288c7b318ddf|

This is the only data which the phone home service gathers from your system. The UUID is specific to the DAS and is randomly generated on startup - it is not machine specific.

### Changes to gathered fields:

- `4.1.1.162`: Phone home service added to Payara Server.

- `4.1.1.164`: UUID added to Payara and the phone home service.

## How is the information transferred?

Gathered phone home data is sent via a `GET` request to `www.payara.fish/phonehome`.

## What is the data used for?

The phone home data is presently used to gathered usage information about Payara Server, such as how long users typically run servers, and what versions they prefer.

Previously this could only be done at an extremely simple level from downloads over time, giving us no idea how Payara is used beyond specific interactions with contributors and clients which may not accurately represent our users.

The phone home service was designed as a non-intrusive survey tool which would only gather data specific to Payara and has no contact with any running applications, or indeed anything on your machine other than the above fields.

## Future Changes to Phone Home

The phone home service acts as a step towards an automated Payara Server update facility.

As of Payara 4.1.1.162 no new fields are planned to be added to the phone home service.

## Source Code

The source code for the phone home script is available to [view on github](https://github.com/payara/Payara/blob/master/nucleus/payara-modules/phonehome-bootstrap/src/main/java/fish/payara/nucleus/phonehome/PhoneHomeTask.javahttps://github.com/payara/Payara/blob/master/nucleus/payara-modules/phonehome-bootstrap/src/main/java/fish/payara/nucleus/phonehome/PhoneHomeTask.java).
