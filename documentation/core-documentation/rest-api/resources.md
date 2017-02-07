
<a name="paths"></a>
## Resources

<a name="configuration_resource"></a>
### Configuration
Used for domain configuration operations


<a name="submitconfiguration"></a>
#### Add or Update a resource
```
POST /management/domain/{resource}
```


##### Description
Use this operation to add new resources to the configuration tree or to update the configuration of an existing resource. If the resource is a parent resource, then the operation would add a new child resource. Otherwise, the operation would update the resource's configuration.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Requested-By**  <br>*required*|This header must ALWAYS be set to the value ***GlassFish REST HTML interface***|string|
|**Path**|**resource**  <br>*required*|The qualified name of the resource. If adding a child resource, the name of the resource's parent. If updating a resource's configuration then it is the name of the target resource.|string|
|**FormData**|**parameter**  <br>*optional*|The name *parameter* is a placeholder for any parameters the resource uses for its creation or update. If multiple parameters are used, repeat this placeholder for each one.|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The operation has executed successfully and contextual information about the result is returned.|[OperationResult](/documentation/core-documentation/rest-api/definitions.md#operationresult)|
|**400**|The operation has failed. One of the possible reasons are:<br>  <ul><br>    <li>The command or method`s request parameters aren`t set correctly.</li><br>    <li>The <code>X-Requested-By</code> header was not set correctly.</li><br>    <li>An integrity error has ocurred with the target resource, for example a resource already exists with the same JNDI name. (An operation result object is returned for examination)</li><br>  </ul>|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**404**|Either the parent resource (when adding new resources) or the target resource (when updating a resource) does not exists.|No Content|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple_auth)**|
|**apiKey**|**[token_cookie](/documentation/core-documentation/rest-api/security.md#token_cookie)**|


<a name="getconfiguration"></a>
#### Get information for a resource
```
GET /management/domain/{resource}
```


##### Description
Use this operation to determine the current configuration of a resource and what are its supported methods, method parameters and available commands.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**resource**  <br>*required*|The qualified name of the resource on the configuration tree. Input this parameter using **dotted** path notation, e.g if the object's name is *nodes.node.localhost-domain1* then the correct value is *nodes/node/localhost-domain1*|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|An object representing the contextual information for the resource|[OperationResult](/documentation/core-documentation/rest-api/definitions.md#operationresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**404**|The specified resource does not exist|No Content|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple-auth)**|
|**apiKey**|**[token_cookie](/documentation/core-documentation/rest-api/security.md#token_cookie)**|


<a name="deleteconfiguration"></a>
#### Delete a resource
```
DELETE /management/domain/{resource}
```


##### Description
Removes the specified resource from the configuration's tree. The deleted resource will no longer be present in the *child-resources* list of the parent's resource.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Requested-By**  <br>*required*|This header must ALWAYS be set to the value ***GlassFish REST HTML interface***|string|
|**Path**|**resource**  <br>*required*|The qualified name of the resource.|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The operation has executed successfully and contextual information about the result is returned.|[OperationResult](/documentation/core-documentation/rest-api/definitions.md#operationresult)|
|**400**|The operation has failed. The `X-Requested-By` header was not set correctly.|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**404**|The target resource does not exists.|No Content|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple-auth)**|
|**apiKey**|**[token_cookie](/documentation/core-documentation/rest-api/security.md#token_cookie)**|


<a name="logging_resource"></a>
### Logging
Used for domain logging purposes


<a name="getlog"></a>
#### Get domain log
```
GET /management/domain/view-log
```


##### Description
Get the server's log contents of the target domain. Each time this operation is executed, the response will include the `X-Text-Append-Next` header to retrieve changes made to the log since the operation was called.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**start**  <br>*optional*|Use this parameter to skip a determined number of characters in the log file.|number(integer)|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The contents of the domain's log as requested.  <br>**Headers** :   <br>`X-Text-Append-Next` (string(url)) : An URL that can be used to retrieve the changes made to this log after this call was executed.|No Content|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|


##### Produces

* `text/plain`


<a name="getlogdetails"></a>
#### Get log entries
```
GET /management/view-log/details
```


##### Description
Get the server's log details of the target domain. The details can be retrieved on both JSON or XML formats. If the 'Accept' header is omitted, the default format is XML.


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|An array of the log records retrieved.|< [LogRecord](/documentation/core-documentation/rest-api/definitions.md#logrecord) > array|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|


##### Produces

* `application/json`
* `application/xml`


<a name="monitoring_resource"></a>
### Monitoring
Used for monitoring operations


<a name="getstatistics"></a>
#### Get monitoring statistics
```
GET /monitoring/domain/{resource}
```


##### Description
Retrieves the monitoring statistics for a monitorable resource in the domain. In order to retrieve the monitoring statistics for a specific resource, you must configure the monitoring level of the specific category the resource falls into (JVM, Connection Pools, ORB, etc.) first.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**resource**  <br>*required*|The name of the monitored resource under the special monitoring tree structure used for Payara. Input this parameter using **dotted** path notation, e.g if the resource's name is *server.jvm.class-loading* then the correct value is *server/jvm/class-loading*|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|An object representing the contextual information for the resource, with the monitoring statistics if a child resource. If the resource is parent resource, then the child resources that can be monitored will be returned.|[MonitoringResult](/documentation/core-documentation/rest-api/definitions.md#monitoringresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**404**|Either the resource does not exist or the category (parent resource) of the resource has not been configured for being monitored yet.|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple-auth)**|
|**apiKey**|**[token_cookie](/documentation/core-documentation/rest-api/security.md#token_cookie)**|


<a name="sessions_resource"></a>
### Sessions
Used for session management


<a name="getsessiontoken"></a>
#### Get session token
```
POST /management/sessions
```


##### Description
Use this method for retrieving a special session token that can be used to authenticate an user when executing administration or monitoring operations.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Requested-By**  <br>*required*|This header must ALWAYS be set to the value ***GlassFish REST HTML interface***|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Returns the session token successfully|[TokenResult](/documentation/core-documentation/rest-api/definitions.md#tokenresult)|
|**400**|The operation has failed. The `X-Requested-By` header was not set correctly.|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple-auth)**|


<a name="deletesessiontoken"></a>
#### Delete session token
```
DELETE /management/sessions/{token}
```


##### Description
Retires a session token so that users can no longer do requests authenticating such token.


##### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Requested-By**  <br>*required*|This header must ALWAYS be set to the value ***GlassFish REST HTML interface***|string|
|**Path**|**token**  <br>*required*|The session token to delete|string|


##### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The session token was deleted successfully.|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**400**|The operation has failed. Either the `X-Requested-By` header was not set correctly or the supplied token does not exist.|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|
|**401**|Users credentials are not valid to execute this operation|[GeneralResult](/documentation/core-documentation/rest-api/definitions.md#generalresult)|


##### Produces

* `application/json`
* `application/xml`
* `text/html`


##### Security

|Type|Name|
|---|---|
|**basic**|**[simple_auth](/documentation/core-documentation/rest-api/security.md#simple-auth)**|
