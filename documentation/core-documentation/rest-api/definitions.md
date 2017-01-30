
<a name="definitions"></a>
## Definitions

<a name="command"></a>
### Command
Holds information for command objects that can be used to execute non CRUD operations.


|Name|Description|Schema|
|---|---|---|
|**command**  <br>*optional*|The name of the command.|string|
|**method**  <br>*optional*|The HTTP method needed to invoke the command. Either GET, POST or DELETE|string|
|**path**  <br>*optional*|The relative path to the resource that represents the command. This path is relative to the URL of the target`s resource.|string|


<a name="generalresult"></a>
### GeneralResult
Represents the general result of an administration or monitoring operation.


|Name|Description|Schema|
|---|---|---|
|**command**  <br>*optional*|The name of the resource/object that is the target of the operation (in case of a successful operation) or the name of the method or command executed (in case of a failed operation).|string|
|**exit_code**  <br>*optional*|The result of the operation's execution, either SUCCESS or FAILURE|string|
|**message**  <br>*optional*|Details the message the server sends in case of encountering an error in executing the operation. If no error was encountered, this property is empty.|string|


<a name="logrecord"></a>
### LogRecord
Represents a log record in the target domain.


|Name|Description|Schema|
|---|---|---|
|**Message**  <br>*optional*|A unique identifier for the message that consists of a module code and a numerical value.|string|
|**loggedDateTimeInMS**  <br>*optional*|The timestamp for this record in UNIX time format.|integer(int64)|
|**loggedLevel**  <br>*optional*|The level of the logged event (EMERGENCY, ALERT,  SEVERE, WARNING, INFO, CONFIG, FINE, FINER, and FINEST)|string|
|**loggerName**  <br>*optional*|Name of the logger that registered the log event.|string|
|**messageID**  <br>*optional*|Identifier of the logged event.|string|
|**nameValuePairs**  <br>*optional*|Contains a key-value tuple of the ID and name of the thread that created the message in the format "_ThreadID=thread-id;_ThreadName=thread-name;"|string|
|**productName**  <br>*optional*|A shorthand alias for the product's edition, profile and version, e.g Payara 4.1|string|
|**recordNumber**  <br>*optional*|The identifier of this log record in a numerical format|integer(int32)|


<a name="method"></a>
### Method
Holds information for a method object that is used for executing CRUD operations of resources.


|Name|Description|Schema|
|---|---|---|
|**messageParameters**  <br>*optional*|A set of metadata information for the method`s body parameters. Only available for POST methods.|< string, [MethodParameter](#methodparameter) > map|
|**name**  <br>*optional*|The name of the method, one of GET, POST or DELETE|string|
|**queryParameters**  <br>*optional*|A set of metadata information for the method`s query parameters. Only available for GET methods.|< string, [MethodParameter](#methodparameter) > map|


<a name="methodparameter"></a>
### MethodParameter
Describes the structure for a method`s message or query parameter.


|Name|Description|Schema|
|---|---|---|
|**acceptableValues**  <br>*optional*|A text that describes the range of possible values for the parameter`s value.|string|
|**defaultValue**  <br>*optional*|The default value of the parameter if ommitted.|string|
|**key**  <br>*optional*|Indicates whether the parameter is a key for the method.|boolean|
|**optional**  <br>*optional*|Indicates whether the parameter is optional or mandatory for the method execution.|boolean|
|**type**  <br>*optional*|The data type of the parameter, one of boolean, string or int.|string|


<a name="monitoringresult"></a>
### MonitoringResult
Represents the result of a monitoring operation when querying for a specific resource.

*Polymorphism* : Composition


|Name|Description|Schema|
|---|---|---|
|**command**  <br>*optional*|The name of the resource/object that is the target of the operation (in case of a succesful operation) or the name of the method or command executed (in case of a failed operation).|string|
|**exit_code**  <br>*optional*|The result of the operation's execution, either SUCCESS or FAILURE|string|
|**extraProperties**  <br>*optional*|A group of additional properties that contains the statistics results and child resources for monitoring.|[extraProperties](#monitoringresult-extraproperties)|
|**message**  <br>*optional*|Details the message the server sends in case of encountering an error in executing the operation. If no error was encountered, this property is empty.|string|

<a name="monitoringresult-extraproperties"></a>
**extraProperties**

|Name|Description|Schema|
|---|---|---|
|**childResources**  <br>*optional*|A list of child resources for the target resource. Each child resource is specified as a key-value pair of the resource\`s name and it\`s URL. This property is only available for the results of query operations.|< string, string(url) > map|
|**entity**  <br>*optional*|A list of the metric information and statistics retrieved since the last monitoring was executed. Each property of this object represents a separate metric/statistic.|< string, [Statistic](#statistic) > map|


<a name="operationresult"></a>
### OperationResult
Represents the result of an administration operation executed when targeting a resource.

*Polymorphism* : Composition


|Name|Description|Schema|
|---|---|---|
|**command**  <br>*optional*|The name of the resource/object that is the target of the operation (in case of a succesful operation) or the name of the method or command executed (in case of a failed operation).|string|
|**exit_code**  <br>*optional*|The result of the operation's execution, either SUCCESS or FAILURE|string|
|**extraProperties**  <br>*optional*|A group of additional properties that contain context information about the resource and tthe operations this resource supports.|[extraProperties](#operationresult-extraproperties)|
|**message**  <br>*optional*|Details the message the server sends in case of encountering an error in executing the operation. If no error was encountered, this property is empty.|string|

<a name="operationresult-extraproperties"></a>
**extraProperties**

|Name|Description|Schema|
|---|---|---|
|**childResources**  <br>*optional*|A list of child resources for the target resource. Each child resource is specified as a key-value pair of the resource`s name and it`s URL. This property is only available for the results of query operations.|< string, string(url) > map|
|**commandLog**  <br>*optional*|A string detailing the exact asadmin command executed on the server. This property is only available for the results of add, update or delete operations.|string|
|**commands**  <br>*optional*|A list of metadata sets of the available non-CRUD operations (asadmin subcommands) that can be executed on the target resource. This property is only available for the results of query operations.|< [Command](#command) > array|
|**entity**  <br>*optional*|Represents the current configuration of a resource. Each property of the resource is configured as a key-value pair of the object itself.|< string, string > map|
|**methods**  <br>*optional*|A list of medatada sets of available CRUD methods that the target resource supports. This property is only available for the results of query operations.|< [Method](#method) > array|


<a name="statistic"></a>
### Statistic
Represents compilation data for the metric of a resource's statistics.


|Name|Description|Schema|
|---|---|---|
|**count**  <br>*optional*|The current value of the statistic. Used for count statistics.|integer(int32)|
|**current**  <br>*optional*|The current value of the statistic since its monitoring began. Used for ranged/string/time statistics|integer(int32)|
|**description**  <br>*optional*|A text that describes what the statistic represents.|string|
|**highwatermark**  <br>*optional*|The highest value of the statistic since its monitoring began. Used for ranged statistics|integer(int32)|
|**lastsampletime**  <br>*optional*|The time at which the statistic was last sampled in UNIX format.|integer(int32)|
|**lowwatermark**  <br>*optional*|The lowest value of the statistic since its monitoring began. Used for ranged statistics|integer(int32)|
|**name**  <br>*optional*|The name of the statistic as shown in client applications|string|
|**starttime**  <br>*optional*|The time at which the monitoring of the statistic began in UNIX format.|integer(int32)|
|**unit**  <br>*optional*|<p>The unit of measurement of the statistic, which is one of the following units of measurement:</p><br><ul><br>  <li><b>count</b> - The cumulative value of an attribute.</li><br>  <li><b>range</b> - The lowest, highest and current value of an attribute over time.</li><br>  <li><b>boundedrange</b> - Same as range, but with fixed limits.</li><br>  <li><b>string</b> - Used to represent the textual state of an object (for example 'CONNECTED', 'DISCONNECTED')</li><br>  <li><b>time</b> - Values of an attribute that are used to provide timing measurements (time taken to perform an operation, average time, etc.)</li><br></ul>|string|


<a name="tokenresult"></a>
### TokenResult
Represents the result of requesting a session token.

*Polymorphism* : Composition


|Name|Description|Schema|
|---|---|---|
|**command**  <br>*optional*|The name of the resource/object that is the target of the operation (in case of a succesful operation) or the name of the method or command executed (in case of a failed operation).|string|
|**exit_code**  <br>*optional*|The result of the operation's execution, either SUCCESS or FAILURE|string|
|**extraProperties**  <br>*optional*|Holds the session token|[extraProperties](#tokenresult-extraproperties)|
|**message**  <br>*optional*|Details the message the server sends in case of encountering an error in executing the operation. If no error was encountered, this property is empty.|string|

<a name="tokenresult-extraproperties"></a>
**extraProperties**

|Name|Description|Schema|
|---|---|---|
|**token**  <br>*optional*|A session token used for authenticating user requests|string|
