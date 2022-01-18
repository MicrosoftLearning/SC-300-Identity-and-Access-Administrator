---
lab:
    title: '18 - Enable sign in and user risk policies'
    learning path: '02'
    module: 'Module 04 -Manage Azure AD identity protection'
---

# Lab 18 - Enable sign in and user risk policies

## Lab scenario

As an additional layer of security, you need to enable and configure your Azure AD organization's sign in and user risk policies.

#### Estimated time: 10 minutes

## Enable User risk policy

1. Sign in to the [https://portal.azure.com]( https://portal.azure.com) using a Global administrator account.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the Azure Active Directory blade, under **Manage**, select **Security**.

1. On the Security blade, in the left navigation, select **Identity protection**.

1. In the Identity protection blade, in the left navigation, select **User risk policy**.

    ![Screen image displaying the User risk policy page and highlighted browsing path](./media/lp2-mod4-browse-to-identity-protection.png)

1. Under **Assignments**, select **All users** and review the available options.

1. You can select from **All users** or **Select individuals and groups** if limiting your rollout.

1. Additionally, you can choose to exclude users from the policy.

1. Under **User risk**, select **Low and above**.

1. In the User risk pane, select **High** and then select **Done**.

1. Under **Controls** > **Access**, select **Block access**.

1. In the Access pane, review the available options.

    **Tip** - Microsoft's recommendation is to Allow access and Require password change.

1. Select the **Require password change** check box and then select **Done**.

1. Under **Enforce Policy**, select **On** and then select **Save**.

## Enable Sign-in risk policy

1. On the Identity protection blade, in the left navigation, select **Sign-in risk policy**.

1. As with the User risk policy, the Sign-in risk policy can be assigned to users and groups and allows you to exclude users from the policy.

1. Under **Sign-in risk**, select **Low and above**.

1. In the Sign-in risk pane, select **High** and then select **Done**.

1. Under **Controls** > **Access**, select **Allow access**.

1. Select the **Require multi-factor authentication** check box and then select **Done**.

1. Under **Enforce Policy**, select **On** and then select **Save**.
