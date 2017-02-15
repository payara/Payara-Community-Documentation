# Contents

* [1. Overview](#1-overview)
* [2. Download Security Fixes](#2-download-security-fixes)
* [3. Locating Security Vulnerabilities](#3-locating-security-vulnerabilities)
* [4. Reporting Security Issues](#4-reporting-security-issues)

## 1. Overview

This section describes how to deal with known or unknown security issues and common vulnerabilities and exploits \(CVEs\) related to Payara Server and Payara Micro.

## 2. Download Security Fixes

Reported security vulnerabilities by the community or Payara Services Limited's costumers are patched and released either in specific patch releases \(for paid support customers exclusively\) or quarterly releases. In some cases, we might release special hotfixes to the community to patch serious vulnerabilities that cannot wait for a quarterly release to be fixed. 

To get the specific fix for a reported vulnerability, please download the specific release that fixed that vulnerability.

## 3. Locating Security Vulnerabilities

In order to locate the release a security update has been included for a specific vulnerability, search in the [security fixes summary](/release-notes/security-fix-list.md) page for the specific vulnerability using its [CVE identifier](https://cve.mitre.org/cve/identifiers/).

For each of these security vulnerabilities, a reference to the _**Pull Requests**_ merged to fix them is given for auditing purposes. If a security vulnerability has been reported, but is not related or it doesn't affect Payara Server or Payara Micro in any way, a proper justification will be detailed in the observations of such vulnerability. This is done to track reported vulnerabilities and keep users informed about them.

## 4. Reporting Security Issues

Payara Services Limited is very active at identifying and fixing possible security vulnerabilities included into Payara Server and Payara Micro that are either inherited from GlassFish upstream or introduced by new features developed.

We strongly encourage users to report such problems in the following ways:

1. If you have a support contract, create a ticket describing the security vulnerabilities detected as you would do for any other bug reports.
2. If you do not have a support contract, please send an email with the described vulnerabilities detected to [security@payara.fish](/mailto:security@payara.fish). **Please don't use this address to report bugs or issues unrelated to security vulnerabilities** as they will be ignored, instead use the GitHub repository [issues page](https://github.com/payara/Payara/issues) for raising a new issue detailing the problem at hand.

Also, note that all networked servers are subject to denial of service \(_DoS_\) attacks, and we cannot provide fixes to generic problems \(such as a client streaming lots of data to your server, or re-requesting the same URL repeatedly\). Instead, focus on security issues that can be targeted at specific topics like session hacking, XSS injection, CSRF attacks and so forth.

Lastly, you can also direct inquiries about reported CVE issues detected in similar Java plataforms or application servers \(like Apache Tomcat,  JBoss Wildfly, etc.\) and let us research whether  or not Payara Server is affected by such issues.