# Release Highlights

The most eye catching feature in this release is a new look for the Admin Console; we’ve given the Admin Console another go over from our initial attempt, rebranding it to look more distinctly Payara!

The more exciting highlight of this release is the Healthcheck Service. In its initial release, this service allows you to monitor CPU usage, the number of times Garbage Collection has occurred, the machine memory usage, the heap memory usage, and any hogging threads.   
Documentation for it can be found [here](Health-Check-Services-Configuration-(Payara-4.1.1.161)\), and documentation for the asadmin commands can be found [here](Health-Check-Services-Admin-Commands-(Payara-4.1.1.161)\).

# Updated Modules

This section details the modules that have been updated since the last release \(4.1.1.154\).

* Jersey 2.22.1
* EclipseLink 2.6.2 \(Patched to payara-p1\)
* GlassFish Corba 4.0.1 \(Patched to payara-p3\)
* Woodstock 4.0.2.10 \(Patched to payara-p2\)
* Metro 2.3.2-b608 \(Patched to payara-p2\)
* MQ 5.1.1-b02 \(Patched to payara-p1\)
* Apache commons-fileupload 1.3.1

# Enhancements

This section details the issues marked as enhancements that have been implemented for this release.

* [511 – Add support for Informix for persisted ejb timers](https://github.com/payara/Payara/issues/511)
* [512 – Update usages of EclipseLink](https://github.com/payara/Payara/issues/512)
* [551/PAYARA-527 - Speed up Payara Micro boot times](https://github.com/payara/Payara/pull/551)
* [566/PAYARA-540 - Removed cause of spurious warning RAR875](https://github.com/payara/Payara/pull/566)
* [570/PAYARA-491 - Redesign of the admin console](https://github.com/payara/Payara/pull/570)
* [572/PAYARA-408 - Option to turn on orb keepalive](https://github.com/payara/Payara/issues/572)
* [576/PAYARA-549 - Currently only deployment artifacts ending in .war are deployed](https://github.com/payara/Payara/pull/577)
* [583/PAYARA-458 – Many threadpools have bad names](https://github.com/payara/Payara/pull/583)
* [586/PAYARA-554 – SQL tracing and slow SQL logging](https://github.com/payara/Payara/pull/586)
* [588 – Payara Micro can’t be stopped and restarted in the same process](https://github.com/payara/Payara/issues/588)
* [593/PAYARA-359 - JBatch supports SQL server](https://github.com/payara/Payara/pull/594)
* [605/PAYARA-518 – Disable SSL3 on Sec-Admin-listener](https://github.com/payara/Payara/pull/605)
* [613/PAYARA-558 – Editing the front page](https://github.com/payara/Payara/pull/613)
* [619/PAYARA-488 – Restart behaviour when running windows service](https://github.com/payara/Payara/pull/619)

# Fixed Issues

This section details the issues marked as bugs that have been fixed for this release.

### Payara Fixes

This section details the fixes implemented by the Payara team or community.

* [195/PAYARA-222 – Jbatch and Postgresql db as job repository fails](https://github.com/payara/Payara/issues/195)
* [229/PAYARA-548 - Fix CDI and SAM](https://github.com/payara/Payara/pull/581)
* [468/PAYARA-323 – Admingui crashes after timeout](https://github.com/payara/Payara/issues/468)
* [481/PAYARA-477 – Behaviour of Logging for @Transactional CDI methods](https://github.com/payara/Payara/issues/481)
* [491/PAYARA-346 – WELD warnings during deployment](https://github.com/payara/Payara/pull/491)
* [492/PAYARA-511 – Redploying war/ear on cluster fails](https://github.com/payara/Payara/issues/492)
* [494/PAYARA-376 – Instance server.log written to despite change of log file name/location](https://github.com/payara/Payara/issues/494)
* [497/PAYARA-490 – admin GUI interface refresh issue](https://github.com/payara/Payara/issues/497)
* [500/PAYARA-406 – Wrong thread name in server.log](https://github.com/payara/Payara/issues/500)
* [502 - Message catalog key not transformed: using.default.ds](https://github.com/payara/Payara/issues/502)
* [505/PAYARA-510 – Payara does NOT rollback when RuntimeException occurs in CDI @Transactional method using JDBC](https://github.com/payara/Payara/issues/505)
* [510/PAYARA-547 - @DataSourceDefinition defined data source can't be used in persistence.xml](https://github.com/payara/Payara/issues/510)
* [525/PAYARA-449 – Sporadic “attempted duplicate class definition for name” in Payara 4.1.153](https://github.com/payara/Payara/issues/525)
* [534/PAYARA-446 – Multiple cookies cannot be added using Headers.putAll\(\)](https://github.com/payara/Payara/pull/534)
* [535/PAYARA-526 - Problems with jndi lookup](https://github.com/payara/Payara/issues/535)
* [536/PAYARA-551 - Websocket @OnOpen sometimes isn't called](https://github.com/payara/Payara/issues/536)
* [539/PAYARA-556 - ACC needs 3 seconds for initialContext.lookup\("myHome"\)](https://github.com/payara/Payara/issues/539)
* [540/PAYARA-520 – Fix Batch: SQL string is not Query](https://github.com/payara/Payara/issues/540)
* [545/PAYARA-492 – Fix WSIT enabled WS services](https://github.com/payara/Payara/pull/545)
* [549/PAYARA-480 - Warnings when connecting via JMX](https://github.com/payara/Payara/issues/549)
* [555/PAYARA-529 - Problem with mcAddress on payara micro](https://github.com/payara/Payara/issues/555)
* [556/PAYARA-496 - ensure the truststore is only written to when we have read/write permissions](https://github.com/payara/Payara/pull/556)
* [560/PAYARA-533 - Upgrade Commons File Upload](https://github.com/payara/Payara/pull/560)
* [561/PAYARA-486 - Fixed wrong session count after failover](https://github.com/payara/Payara/pull/561)
* [564/PAYARA-538 - Upstream commit breaks redeploy of CargoTracker](https://github.com/payara/Payara/issues/564)
* [567/PAYARA-371 - Spurious warning when changing open mq admin/guest password](https://github.com/payara/Payara/issues/567)
* [578/PAYARA-346 - added javax.ejb as an imported package to the weld integration bundle](https://github.com/payara/Payara/pull/578)
* [589/PAYARA-557 - Incorrect Server Version and Vendor provided in JMX Bean](https://github.com/payara/Payara/issues/589)
* [596/PAYARA-568 - Payara Blue uses incorrect key algorithm ](https://github.com/payara/Payara/issues/596)
* [603/PAYARA-560 – Not all batch objects use prefix/suffix](https://github.com/payara/Payara/issues/603)
* [615/PAYARA-495 - Fix FileNotFoundException "noop=true"](https://github.com/payara/Payara/pull/615)
* [618 – Deployment of EJB\_Timer\_App when app has orm.xml](https://github.com/payara/Payara/issues/618)
* [627 – Webservice deployed from directory archive on windows fails](https://github.com/payara/Payara/issues/627)
* [632/PAYARA-602 - Update woodstock version to fix exploit](https://github.com/payara/Payara/pull/632)

# Known Issues

Known issues can be seen on our GitHub issues page here: [https://github.com/payara/Payara/issues](https://github.com/payara/Payara/issues)



