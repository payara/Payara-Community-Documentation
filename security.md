# Security Information

## Overview

Reported security vulnerabilities by the community or Payara Services Limited's costumers are patched and released either in specific patch releases \(for paid support customers exclusively\) or quarterly releases. To get the specific fix for a reported vulnerability, please download the specific release that fixed that vulnerability.

If you don't know in which release a security update has been included for a specific vulnerability, search in the [security fixes summary](/release-notes/security-fix-list.md) page for the specific vulnerability using its [CVE identifier](https://cve.mitre.org/cve/identifiers/).

## Reporting Security Issues with Payara Server

Payara Services Limited is very active at identifying and fixing possible security vulnerabilities included into Payara Server and Payara Micro that are either inherited from GlassFish upstream or introduced by new features developed.

We strongly encourage users to report such problems in the following ways:

1. If you are a customer of support services, create a ticket in the [support portal](http://support.payara.fish) describing the security vulnerabilities detected as you would do for any other bug reports.
2. If not a customer of support services, please send an email with the described vulnerabilities detected to [security@payara.fish](/mailto:security@payara.fish). **Please don't use this address to report bugs or issues unrelated to security vulnerabilities** as they will be ignored, instead use the GitHub repository page for raising a [new issue](https://github.com/payara/Payara/issues) detailing the problem at hand.

Also, note that all networked servers are subject to denial of service \(_DoS_\) attacks, and we cannot provide fixes to generic problems \(such as a client streaming lots of data to your server, or re-requesting the same URL repeatedly\). Instead, focus on security issues that can be targeted at specific topics like session hacking, XSS injection, CSRF attacks and so forth.

Lastly, you can also direct inquiries about reported CVE issues detected in similar Java plataforms or application servers \(like Apache Tomcat,  JBoss Wildfly, etc.\) and let us research whether  or not Payara Server is affected by such issues.



