---
lab:
    title: '15 - Implement and test a conditional access policy'
    learning path: '02'
    module: 'Module 03 -Plan, implement, and administer conditional access'
---

# Lab 15 - Implement and test a conditional access policy

## Lab scenario

Your organization needs to be able to limit user access to its internal applications. You must deploy an Azure Active Directory conditional access policy.

#### Estimated time: 10 minutes

## Create a conditional access policy

Azure Active Directory conditional access is an advanced feature of Azure AD that allows you to specify detailed policies that control who can access your resources. Using Conditional Access, you can protect your applications by limiting users' access based on things like groups, device type, location, and role.

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the Azure Active Directory blade, under **Manage**, select **Security**.

1. On the Security blade, in the left navigation, select **Conditional access**.

1. On the top menu, select **New policy**.

    ![Screen image displaying the Conditional Access blade with New policy highlighted](./media/lp2-mod1-conditional-access-new-policy.png)

1. In the **Name** box, enter **Yammer conditional access**.

1. This is the name being using for this exercise, you may choose another name if you wish.

1. Under **Assignments**, select **Users and groups**.

1. On the Include tab, select the **Users and groups** check box.

1. In the Select pane, select your administrator account and then select **Select**.

1. Select **Cloud apps or actions**.

1. Verify **Cloud apps** is selected and then select **Select apps**.

1. In the Select pane, select **Office 365 Yammer** and then select **Select**.

1. Select **Conditions** and then select **Conditions**.

1. Under **Configure**, select **Yes** and then select **Any location**.

1. Under **Access controls**, select **Grant**.

1. In the Grant pane, select **Block access** and then select **Select**.

    >Note
    >This policy is being configure for the exercise only and is being used to quickly demonstrate a conditional access policy.

1. Under **Enable policy**, select **On**, and then select **Create**.

    ![Screen image displaying a new conditional access policy with policy settings highlighted](./media/lp2-mod3-create-conditional-access-policy.png)

## Test the conditional access policy

You should test your conditional access policies to ensure they working as expected.

1. Open a new browser tab and then browse to [https://www.yammer.com/office365](https://www.yammer.com/office365).

     Your credentials should be passed through.

1. Verify you are prevented from successfully access Microsoft Yammer.

    ![Screen image displaying a the blocked resource access due to an enabled conditional access policy](./media/lp2-mod3-test-conditional-access-policy.png)

1. If you are signed in, close the tab, wait 1-2 minutes, and then retry.

1. Close the tab and return to the Conditional Access blade.

1. Select the **Yammer conditional access** policy.

1. Under **Enable policy**, select **Off** and then select **Save**.
