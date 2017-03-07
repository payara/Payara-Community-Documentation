# JDBC Connection Validation

## JDBC Connection Validation Changes
From Payara 4.1.1.171 the validators `table` and `custom-validation` now take the connection pool's _Statement Timeout_ into account.
Previously the lack of timeouts would lead to validators endlessly waiting for a response.

For details on the new capabilities of Payara Server connection pools, see the [Advanced JDBC Configuration and Diagnostics page](/documentation/extended-documentation/advanced-jdbc/advanced-jdbc-configuration-and-diagnostics.md) in the extended documentation.
