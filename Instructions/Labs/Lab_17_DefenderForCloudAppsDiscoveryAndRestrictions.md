---
lab:
  title: 17 - Defender for Cloud Apps application discovery and enforcing restrictions
  learning path: '03'
  module: Module 03 - Implement Access Management for Apps
  description: Block unsanctioned apps using Microsoft Defender for Cloud Apps. Explore the features and use of the Defender portal.
  duration: 10 minutes
  level: 200
  islab: true
  primarytopics:
    - Microsoft Defender for Cloud Apps
    - Microsoft Entra
---

# Lab 17 - Defender for Cloud Apps application discovery and enforcing restrictions

### Login type = Microsoft 365 admin

## Lab scenario

Microsoft Defender for Cloud Apps utilizes logs from network traffic to identify the applications that users are accessing.  Traffic logs from on-premises firewalls will provide a snapshot report on the most common applications and the users that are accessing these apps.  Traffic from managed devices will be fed into the Microsoft Defender for Cloud Apps discovery overview dashboard

#### Estimated time: 10 minutes

### Exercise 1 - Defender for Cloud Apps discovery

#### Task 1 - Discovery apps in Defender for Cloud Apps

1. Sign in to **Microsoft Defender portal** at `https://security.microsoft.com` using a Global Administrator account.

1. On the **Microsoft Defender portal**, in the left navigation menu, expand the **Cloud Apps**, select **Cloud App Catalog**.

1. In the filter bar, set **Category** to **Cloud storage**.

1. From the list of apps, select **Dropbox**.

1. In the app details pane, review the **Risk score** shown under the **General** tab.

1. Open a new browser tab and go to **Dropbox** at `https://www.dropbox.com`.

1. You will be able to access this website.

1. Close the tab for Dropbox.

1. Return to the Defender for Cloud Apps screen.

1. In the **Dropbox** details pane, select **Sanction**.

#### Task 2 - Restrict Apps in Defender for Cloud Apps

1. Return to the **Cloud app catalog** in the Microsoft Defender portal.

1. In the list of apps, locate **Dropbox**.

1. In the **Dropbox** details pane, select **Unsanction**.

1. Select **Save** to apply the change.

> **Note:** There may be a delay when sanctioning or unsanctioning an application. Changes can take up to 5 minutes to take effect.

Once an application is marked as **unsanctioned**, access to the app is blocked on devices that are onboarded to **Microsoft Defender for Endpoint** and integrated with **Microsoft Defender for Cloud Apps**, including:
- Browser access
- InPrivate or Incognito browser sessions
- App downloads from stores

### Exercise summary

In this exercise, you reviewed cloud app discovery data and configured app restrictions in Microsoft Defender for Cloud Apps. This exercise showed how to identify and govern shadow IT in the organization.
