---
lab:
    title: '28 - Monitor and managed security posture with Identity Secure Score'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 28 - Monitor and managed security posture with Identity Secure Score

## Lab scenario

Azure AD Identity Protection provides automated detection and remediation to identity-based risks, and provides data in the portal to investigate potential risks. Azure AD Identity Protection also provide an Identity Secure Score to monitor and improve your identity security posture.  In the same manner as Microsoft 365 Defender and Microsoft Defender for Cloud, Identity Secure Score provides improvement actions and recommendations that can improve your overall security posture for identity in Azure Active Directory.  This lab will explore this capability. 

#### Estimated time: 15 minutes

### Exercise 1 - Using Identity Secure Score to monitor and manage identity security posture

#### Task 1 - Review Identity Secure Score and improvement actions

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator.

1. Search for and then select **Azure AD Identity Protection**.

1. In the **Overview** tile, you will find **Identity Secure Score**.

1. Select **Identity Secure Score**.  This will take you to the Identity Secure Score dashboard.

1. Scroll down to view the **Improvement actions**.

1. In contrast to the improvement actions in Microsoft Defender for Cloud and Microsoft 365 Defender, these improvement actions are specific to identity.  This provides a more focused list of potential actions to your security posture management.  Any improvement actions initiated from this list will also provide an impact to your overall tenant security posture. 

#### Task 2 - Execute an improvement action

1. To improve one area of the identity security posture, select **Turn on sign-in risk policy**.

1. In the tile that opens, scroll down and select **Get Started**.

1. A new tab will open for **Identity Protection | Sign-in risk policy**.

1. Select **All users** under **Assignments**.

1. Select **Medium and above** under **Sign-in risk**.

1. Select **Allow** - **Require multi-factor authentication** under **Controls**.

1. Turn the **Enforce policy** to **On**, and select **Save**.

1. You have created a Sign-in risk policy that should now increase your Identity Secure Score.  This will take up to 24 hours to take affect in your Identity Secure Score.

1. Review other improvement actions and the steps to create and enable them.

# RobertS -- Do you know if there is any way to force the Identity Secure Score to recalculate.  I know you said it will take 24-hours.  I searched in DOCS but did not find anything that might force the update.

