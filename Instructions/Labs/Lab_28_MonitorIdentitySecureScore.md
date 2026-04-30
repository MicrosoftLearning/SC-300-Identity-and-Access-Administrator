---
lab:
  title: 28 - Monitor and managed security posture with Identity Secure Score
  learning path: '04'
  module: Module 04 - Plan and Implement and Identity Governance Strategy
  description: Microsoft Entra Identity Protection provides automated detection and remediation to identity-based risks, and provides data in the portal to investigate potential risks. Microsoft Entra Identity Protection also provides an Identity Secure Score to monitor and improve your identity security posture. Review and execute an improvement action.
  duration: 15 minutes
  level: 300
  islab: true
  primarytopics:
    - Microsoft Defender
    - Microsoft Defender for Cloud
    - Microsoft Defender XDR
    - Microsoft Entra
    - Microsoft Entra ID
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

2. Open **Entra ID** from the left menu and select **Identity Secure Score**

3. Review the information provided in the dashboard page page.

4. Notice the value to **Identity Secure Score**, your **Score History** and other information.

5. Scroll down to view the **Recommdendations**.

**Lab Tip** - In contrast to the recommendations in Microsoft Defender for Cloud and Microsoft Defender XDR, these actions are specific to identity.  This provides a more focused list of potential actions to your security posture management for identity. Any recommendations initiated from this list will also provide an impact to your overall tenant security posture. 

#### Task 2 - Execute an improvement action

1. To improve one area of the identity security posture, select **Protect all users with a user risk policy**.

2. In the page that opens, review the risk. You should have users that are unprotected. Additionally, you see an **Action plan** on how to resolve the threat.

3. Select the link **Follow these steps to create a Conditional Access policy from scratch or by using a template**. Review the steps in the article.

4. Close the article tab, and return to the tab with **Microsoft Entra ID** opened.

5. From the menu on the left, select **Conditional Access**.

6. Name the policy: **User Risk remediation**.

7. Under **Users or Agents (Preview)** select **0 users or agents (Preview)** and then, on the **Include** tab, select **All users**.

8.  On the **Exclude** tab, use **Users and groups** to exclude **MOD Administrator**

9. Under **Target resources** select **No target resources selected** and then **All resources (formerly 'All cloud apps')**.

10. Under **Conditions** select **0 conditions selected** and then, under **User risk**, select **Not configured**.

11. Under **User risk** select **Configure - Yes** and then the checkboxes for **Medium** and **High** and then select **Done**.

12. Under **Access controls > Grant** select **0 controls selected**, scroll down and select the checkbox for **Require risk remediation**. Read the warning and scroll up to verify that **Require authentication strength > Multifactor authentication** was automatically selected and then scroll down and select the **Select** button. Note that **Access controls > Session** has also been updated to show **Sign-in frequency - Every time**.

13. Under **Enable Policy** select **On** and then select **Create**.

14. You have created a User risk policy that should now increase your Identity Secure Score.  This will take up to 24 hours to take affect in your Identity Secure Score.
