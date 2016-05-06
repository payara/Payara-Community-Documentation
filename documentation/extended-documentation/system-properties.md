# Contents
* [1. Overview](#1-overview)
* [2. Documentation Conventions](#2-documentation-conventions)
* [3. System Properties](#3-system-properties)

# 1. Overview
This page details the new system properties added to Payara Server.

# 2. Documentation Conventions
_${Product-Root}_ - This is the root of the Payara server directory, referring to where you have Payara installed.  
_${Domain}_ - This refers to the name of your Payara domain.  
_${Target}_ - This refers to the name of an instance or cluster.  
_${Cluster-Config}_ - This refers to the name of a cluster configuration.

# 3. System Properties

| Option | Value Type | Description | Accepted Values | Default |
|---------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------|-------------------------|---------|
| fish.payara.clientHttpsProtocol | String | Sets the TLS version to be used by the asadmin client. This is separate from the TLS version set for HTTPS communication on a listener. | TLSv1, TLSv1.1, TLSv1.2 | TLSv1.2 |
