# Logging features in Payara Server

Payara Server provides additional features and improvements of logging on top of what GlassFish 4.0 Open Source Edition provides.

## Compress log files on rotation

Both Payara Server and GlassFish 4.0 Open Source Edition provide option to rotate files after configurable interval (given either by the size of the log file or by time elapsed). On top of that, Payara Server can be configured to compress rotated files automatically. This is done transparently, so that it is still possible to view the log history in the log viewer in the Web Admin Console, even from compressed files.

### Using Web Admin Console

When log rotation is configured, you can turn on compression of rotated files in the `Logger Settings` section, by ticking `Compress on Rotation` checkbox:

![Compress on Rotation enabled](images/compress_on_rotation.png)



### Using `asadmin` utility
