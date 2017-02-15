# Contents

* [1. Overview](#1-overview)
* [2. Release Strategy](#2-release-strategy)
  * [2.1.Naming Strategy](#21-naming-strategy)
  * [2.2. Work Strategy](#22-work-strategy)
    * [2.2.1. Change Freeze](#221-change-freeze)
    * [2.2.2. GlassFish Upstream Cherry-Pick](#222-glassfish-upstream-cherry-pick)
* [3. GitHub](#3-github)
  * [3.1. How to contribute](#31-how-to-contribute)
  * [3.2. Issue Tracking](#32-issue-tracking)

## 1. Overview

This page provides some general information about the Payara Project.

## 2. Release Strategy

Payara has a release every quarter. Each release incorporates fixes and enhancements from the Payara team, GlassFish upstream, and the community.

### 2.1. Naming Strategy

The Payara Server naming strategy works off of the pre-existing GlassFish naming strategy: Append the year and quarter as the final dot version of the release. For example, for the Payara Server's release built on GlassFish 4.1, released in quarter 3 of 2015, the version number would be payara-4.1.153.

In the case of updates, we will simply attach an additional point number to the end of the version number described above. For example, if a patch is released for Payara 4.1.152, the version number would be 4.1.152.1. This will be in addition to any extra point releases that Oracle do for GlassFish, so it's possible for a version number to be something like 4.1.1.152.1!

Releases will also have a name attached to the release. For example, the name attached to Payara Server 4.1.152 is \#badassfish.

### 2.2. Work Strategy

From Payara Server 4.1.152 onwards, we will be implementing a strategy concerning pulling in changes from the GlassFish upstream, and to making changes late into a release's development time.

#### 2.2.1. Change Freeze

Two to three weeks before a release, we will implement a change freeze. This means that no new features or changes will go into the coming release of Payara Server.

The remaining two to three weeks will be used for finding any bugs brought on by changes and fixes implemented for the coming release. If any bugs are found, these will be corrected before the release; if we can't fix it before the release date, we will simply revert the change that caused the bug \(pending a review\).

#### 2.2.2. GlassFish Upstream Cherry-Pick

We aim to do three cherry picks from the GlassFish upstream for each release: just after a release; at the beginning of the penultimate month of the release; and again at the beginning of the final month of the release \(before the change freeze\).  
This to allow us time to find and fix any errors that may be brought in from the GlassFish upstream.

If a bug fix is committed to the GlassFish upstream during our change freeze, we will consider pulling in that solitary commit before the release.

## 3. GitHub

The [Payara project is hosted on GitHub](https://github.com/payara/Payara), allowing us to make use of the various tools GitHub has integrated for managing projects.

GitHub also allowa the community access to view and edit the source code very easy and in a public manner.

### 3.1. How to Contribute
For an in-depth guide on how to contribute to Payara, see here: https://github.com/payara/Payara-Server-Documentation/blob/master/general-info/contributing-to-payara.md.

In brief, we make use of the Fork and Pull model (see here: https://help.github.com/articles/using-pull-requests/). This means that if you want to make any changes, you'll need to fork the Payara project and make your changes in your own repository. Before we merge your pull request though, you must read and sign the Individual Contributor License Agreement (CLA) before sending it to us at the address specified on the document, or as an email attachment to [info@payara.fish](mailto:info@payara.fish).

Once we've received the CLA and checked it for any mistakes, we'll allow any pull requests you've made to start being merged.

In most cases, pull requests will not be merged immediately. This is to allow the Payara team, and other members of the community, to review and dliberate over any of the changes made; we will typically wait 2-3 days before merging any pull requests.

### 3.2. Issue Tracking

We make use of GitHub's integrated [issue tracker](https://github.com/payara/Payara/issues) to allow the community to create enhancement and bug fix requests. The only requirements to create a bug fix or enhancement request is a GitHub account, and a reproducible bug or idea for an enhancement; you do not need to sign the _CLA_ to create an enhancement or bug fix request. We also provide an [Issue Template](https://github.com/payara/Payara/blob/master/.github/ISSUE_TEMPLATE.md) that can help you describe bug reports or enhancement requests in an easier manner.

Someone on the Payara team, or someone from the community, will then investigate and converse with you about the enhancement request or bug report.

We also attach labels and milestones to issues to help both us, and the community, manage the workflow of these issues.
