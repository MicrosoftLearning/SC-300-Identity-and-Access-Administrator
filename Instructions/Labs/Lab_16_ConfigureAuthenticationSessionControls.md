---
lab:
    title: '16 - Configure authentication session controls'
    learning path: '02'
    module: 'Module 03 -Plan, implement, and administer conditional access'
---

# Lab 16 - Configure authentication session controls

## Lab scenario

As part of your company's larger security configuration, you must test a conditional access policy that can be used to control sign in frequency.

#### Estimated time: 10 minutes

## Configure sign in frequency controls using a conditional access policy

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the Azure Active Directory blade, under **Manage**, select **Security**.

1. On the Security blade, in the left navigation, select **Conditional access**.

1. On the top menu, select **New policy**.

    ![Screen image displaying the Conditional Access blade with New policy highlighted](./media/lp2-mod1-conditional-access-new-policy.png)

1. In the **Name** box, enter **Sign in frequency**.

1. Under **Assignments**, select **Users and groups**.

1. On the Include tab, select the **Users and groups** check box.

1. In the Select pane, select your administrator account and then select **Select**.

1. Select **Cloud apps or actions**.

1. Verify **Cloud apps** is selected and then select **Select apps**.

1. In the Select pane, select **Office 365** and then select **Select**.

1. Under **Access controls**, select **Session**.

1. In the Session pane, select **Sign-in frequency**.

1. In the value box, enter **30**.

1. Select the units menu, select **Days**, and then select **Select**.

1. Under **Enable policy**, select **Report-only**, and then select **Create**.

    ![Screen image displaying a new conditional access policy with policy settings highlighted](./media/lp2-mod3-create-session-conditional-access-policy.png)

    >[!NOTE]
    >Report-only mode is a new Conditional Access policy state that allows administrators to evaluate the impact of Conditional Access policies before enabling them in their environment. With the release of report-only mode:
    >
    >- Conditional Access policies can be enabled in report-only mode.
    >- During sign-in, policies in report-only mode are evaluated but not enforced.
    >- Results are logged in the Conditional Access and Report-only tabs of the Sign-in log details.
    >- Customers with an Azure Monitor subscription can monitor the impact of their Conditional Access policies using the Conditional Access insights workbook.
