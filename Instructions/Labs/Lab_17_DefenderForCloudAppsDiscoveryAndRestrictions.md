---
lab:
    title: '17 - Defender for Cloud Apps application discovery and enforcing restrictions'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 17 - Defender for Cloud Apps application discovery and enforcing restrictions

## Lab scenario

Microsoft Defender for Cloud Apps utilizes logs from network traffic to identify the applications that users are accessing.  Traffic logs from on-premises firewalls will provide a snapshot report on the most common applications and the users that are accessing these apps.  Traffic from managed devices will be fed into the Microsoft Defender for Cloud Apps discovery overview dashboard

#### Estimated time: 10 minutes

### Exercise 1 - Defender for Cloud Apps discovery

#### Task 1 - Discovery apps in Defender for Cloud Apps

1. Sign in to [https://security.microsoft.com](https://security.microsoft.com) using a Global Administrator account.

1. On the left menu, scroll to the bottom and select **More resources**.

1. In the **More resources** window, locate and select **Open** under **Microsoft Defender for Cloud Apps**.  This will take you to the **Microsoft Defender for Cloud Apps** portal within the Microsoft 365 account.

1. Select the **Discover** drop-down in the left menu and select **Cloud App catalog**.

1. In **Browse by category**, select **Cloud storage**.

1. In the list of apps, note the **Risk score** next to the app name.  

1. Open another browser tab and navigate to **Dropbox.com**.

1. You will be able to access this website.


#### Task 2 - Restrict Apps in Defender for Cloud Apps

1. Return to the **Discovered apps** tile and select the **Tag as unsanctioned** for Dropbox.  **Note**: This is located next to the circled check-mark.

1. This process allows you to block applications that are not sanctioned within your company policy, limiting Shadow IT within your organization.

**Note**: There is a delay between unsanctioning an application and that application being blocked.

Once the application has been blocked as unsanctioned, the application will not be accessible through browser, in-private browser, or store download on a Client that is onboarded to MDE (Microsoft Defender for Endpoint) and Microsoft Defender for Cloud Apps is connected with MDE.



