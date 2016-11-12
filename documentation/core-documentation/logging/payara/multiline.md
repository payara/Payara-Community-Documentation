# Multiline Mode for Logging

_Since version 4.1.1.164_

When Multiline mode is enabled, the log message body is printed on a new line after the message header for each log record. This will lead to a more human-readable format of the log file.

To enable the Multiline mode using the Web Console:

![Multiline mode in the Web Console](images/multiline.png)

To enable the Multiline mode using the `asadmin` tool:

```
asadmin> set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.multiLineMode='true'
```

After the Multiline mode is enabled, the log messages might look like this:

![Multiline mode in the Web Console](images/multiline_example.png)
