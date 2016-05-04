# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. Starting and Stopping the Asadmin Recorder](#3-starting-and-stopping-the-asadmin-recorder)
* [4. Configuring the Asadmin Recorder](#4-configuring-the-asadmin-recorder)
* [5. Running the Generated Scripts](#4-running-the-generated-scripts)
* [6. Appendices](#6-appendices)
  * [6.1 Asadmin Commands](#61-asadmin-commands)

# 1. Overview
This page will cover how to use the Asadmin Recorder feature of Payara Server.  

This feature allows you to record the actions you take in the admin console as asadmin commands, aiding with automating or reproducing your setup across multiple Payara Server installations.

# 2. Documentation Conventions

# 3. Starting and Stopping the Asadmin Recorder
From the admin console, you should be able to see a button labelled _Enable Asadmin Recorder_ or _Disable Asadmin Recorder_, depending on whether or not the asadmin recorder feature is enabled or not. Clicking this button will enable or disable the asadmin recorder feature respectively.

Once enabled or disabled, the asadmin recorder will remain enabled/disabled until specifically enabled or disabled again through clicking this button or using the appropriate asadmin command - the asadmin recorder will remain enabled or disabled across server restarts.

# 4. Configuring the Asadmin Recorder

# 5. Running the Generated Scripts

# 6. Appendices

## 6.1 Asadmin Commands

| Command | Description | Options |
|------------------------------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| get-asadmin-recorder-configuration | Returns the current configuration of the Asadmin Recorder service. |  |
| set-asadmin-recorder-configuration | Configures the Asadmin Recorder service. | `--enabled` - Enables or Disables the Asadmin Recorder service.  
`--outputLocation` - Specifies the absolute file path of where the recorded asadmin commands will be written to.  
`--filterCommands` - Specifies whether or not the commands specified with the _--filteredcommands_ option should be excluded from being recorded or not.  
`--filteredCommands` - A comma separated list of asadmin commands to exclude from being recorded. |
| enable-asadmin-recorder | Enables the Asadmin Recorder service with it's current configuration settings. |  |
| disable-asadmin-recorder | Disables the Asadmin Recorder service. |  |
| asadmin-recorder-enabled | Returns whether or not the Asadmin Recorder service is enabled. |  |

