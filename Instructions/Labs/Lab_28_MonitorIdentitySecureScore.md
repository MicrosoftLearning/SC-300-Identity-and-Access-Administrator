---
lab:
    title: '28 - Monitor and managed security posture with Identity Secure Score'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 28 - Monitor and managed security posture with Identity Secure Score

## Lab scenario

Microsoft Entra Identity Protection provides automated detection and remediation to identity-based risks, and provides data in the portal to investigate potential risks. Microsoft Entra Identity Protection also provide an Identity Secure Score to monitor and improve your identity security posture.  In the same manner as Microsoft 365 Defender and Microsoft Defender for Cloud, Identity Secure Score provides improvement actions and recommendations that can improve your overall security posture for identity in Microsoft Entra ID.  This lab will explore this capability. 

#### Estimated time: 15 minutes

### Exercise 1 - Using Identity Secure Score to monitor and manage identity security posture

#### Task 1 - Review Identity Secure Score and improvement actions

1. Sign in to the [https://entra.microsoft.com](https://entra.microsoft.com) as a Global administrator.

2. Open the **Protection** menu and select **Identity Secure Score**

3. In the **Overview** tile, you will find **Identity Secure Score**.

4. Select **Identity Secure Score**.  This will take you to the Identity Secure Score dashboard.

5. Scroll down to view the **Improvement actions**.

6. In contrast to the improvement actions in Microsoft Defender for Cloud and Microsoft 365 Defender, these improvement actions are specific to identity.  This provides a more focused list of potential actions to your security posture management.  Any improvement actions initiated from this list will also provide an impact to your overall tenant security posture. 

#### Task 2 - Execute an improvement action

1. To improve one area of the identity security posture, select **Protect all users with a sign-in risk policy**.

2. In the tile that opens, scroll down and select **Get Started**.

3. A new tab will open for **Identity Protection | Sign-in risk policy**.

4. Select **All users** under **Assignments**.

5. Select **Medium and above** under **Sign-in risk**.

6. Select **Allow** - **Require multi-factor authentication** under **Controls**.

7. Turn the **Policy enforcement** to **Enabled** (if not done so already), and select **Save**.

8. You have created a Sign-in risk policy that should now increase your Identity Secure Score.  This will take up to 24 hours to take affect in your Identity Secure Score.

9. Review other improvement actions and the steps to create and enable them.
