---
lab:
    title: '28 - Monitor and managed security posture with Identity Secure Score'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 28 - Monitor and managed security posture with Identity Secure Score

### Login type = Microsoft 365 admin

## Lab scenario

Microsoft Entra Identity Protection provides automated detection and remediation to identity-based risks, and provides data in the portal to investigate potential risks. Microsoft Entra Identity Protection also provides an Identity Secure Score to monitor and improve your identity security posture.  In the same manner as Microsoft Defender XDR and Microsoft Defender for Cloud, Identity Secure Score provides improvement actions and recommendations that can improve your overall security posture for identity in Microsoft Entra ID.  This lab will explore this capability. 

**Note** - Since this lab is running on a new created tenant environment, you will probably get an Identity Secure Score of 30% or less.  It takes about 24 hours for viable data to enter the calculation to give you a valid score.

#### Estimated time: 15 minutes

### Exercise 1 - Using Identity Secure Score to monitor and manage identity security posture

#### Task 1 - Review Identity Secure Score and improvement actions

1. Sign in to the [https://entra.microsoft.com](https://entra.microsoft.com) as an administrator.

2. From the left menu and select **Identity Secure Score**

3. Review the information provided in the dashboard page page.

4. Notice the value to **Identity Secure Score**, your **Score History** and other information.

5. Scroll down to view the **Recommdendations**.

**Lab Tip** - In contrast to the recommendations in Microsoft Defender for Cloud and Microsoft Defender XDR, these actions are specific to identity.  This provides a more focused list of potential actions to your security posture management for identity. Any recommendations initiated from this list will also provide an impact to your overall tenant security posture. 

#### Task 2 - Execute an improvement action

1. To improve one area of the identity security posture, select **Protect all users with a sign-in risk policy**.

2. In the page that opens, review the risk. You should have 33 users that are unprotected. Additionally, you see an **Action plan** on how to resolve the threat.

3. Select the link **Follow these steps to create a Conditional Access policy from scratch or by using a template**. Review the steps in the article.

4. Close the article tab, and return to the tab with **Microsoft Entra ID** opened.

5. From the menu on the left, select **Conditional Access**.

6. Select **+ Create new policy**.

7. Use the following values to create the policy:

| Field | Value |
| :--- | :--- |
| Name | **Sign-in risk protection policy |
| Assignments | 1. Select **0 users or agents (Preview) selected |
|             | 2. On the **Include** tab mark **All users** |
|             | 3. On the **Excdlue** tab, use the **Users and groups** to exclude **MOD Administrator** |
| Target resources | **All resources (formerly All cloud resource)** |
| Network | Leave at default |
| Conditions | 1. Select **0 conditions selected** |
|            | 2. Under **Sign-in risk** select the **Not configured** link. |
|            | 3. Set **Configure = Yes** and mark the box next to **High** and **Medium**. |
|            | 4. Select **Done** to save changes. |
| Access controls | 1. Under **Grant** select **0 controls selected**. |
|                 | 2. Select **Require risk remediation**. |
|                 | 3. Under the **Require authentication strength** select **Phishing-resistant MFA**. |
| Session | Leave at default |

8. Set **Enable policy** to **Report-only**.  You can use the WhatIf function to verify the policy before you enable it.

9. Select **Create**.
