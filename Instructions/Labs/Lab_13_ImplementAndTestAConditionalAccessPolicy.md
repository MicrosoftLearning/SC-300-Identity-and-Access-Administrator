---
lab:
    title: '13 - Implement and test a conditional access policy'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 13 - Working with security defaults

## Lab scenario

You must configure the Azure Active Directory security default settings in your organization.
    **This is a completely optional lab!!**  You can turn on / off Security Defaults, just to find out where the menu option is.  But the key points to remember are from the training.  Note that if you turn on Security Defaults, and do not disable it, later labs involving Conditional Access will not work.

#### Estimated time: 7 minutes

### Exercise - Prework

To be able to enable Security Defaults, you have to delete or disable any existing Conditional Access policies.  Reminder that in a previous lab we built a policy to enforce MFA for Delia.  You will need to disable that before you can perform the below steps.

1. Log into the Azure portal.
2. Open Azure Active Directory.
3. From the Security section of the menu select **Security** then select **Conditional Access**.
4. Click on any Conditional Access policy that is set to On or Report-Only and change them to Off.

### Exercise 1 - Enabling Security Defaults

#### Task 1 - Turn on security defaults

To enable security defaults in your directory:

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Select the **Show portal menu** hamburger icon and then select **Azure Active Directory**.

    ![Azure portal menu with Azure Active Directory selected](./media/azure-portal-menu-aad.png)

3. In the left navigation, in the Manage section, select **Properties**.

4. At the bottom of the Properties blade, select **Manage Security defaults**.

5. Set the **Enable security defaults** toggle to **Yes**.

6. This may already be enabled.

7. Select **Save**.

#### Task 2 - Disabling security defaults

Organizations that choose to implement Conditional Access policies that replace security defaults must disable security defaults.

To disable security defaults in your directory:

1. Browse to the [https://portal.azure.com](https://portal.azure.com/) and sign in using a Global administrator account for the directory.

2. Select the **Show portal menu** hamburger icon and then select **Azure Active Directory**.

3. At the bottom of the Properties blade, select **Manage Security defaults**.

4. Set the **Enable security defaults** toggle to **No**.

    ![Screen image of security defaults being disabled and selection of the required reason for disabling. In this case, the organization is using Conditional Access.](./media/security-defaults-disable-before-conditional-access.png)

5. Select **Save**.


# Lab 15 - Implement and test a conditional access policy

## Lab scenario

Your organization needs to be able to limit user access to its internal applications. You must deploy an Azure Active Directory conditional access policy.

#### Estimated time: 12 minutes

### Exercise 1 - Set a conditional access policy to block DebraB from accessing Yammer

#### Task 1 -- Confirm DebraB has access to Yammer

1. Launch a new InPrivate browser window.
2. Connect to [https://www.office.com](https://www.office.com) 
3. When prompted, log in as DebraB:

    | Setting | Value |
    | :--- | :--- |
    | Username | **DebraB@** `<<your lab domain>>.onmicrosoft.com` |
    | Password | Enter the admin password of the tenant(Refer the Lab Resources tab to retrieve the tenant's admin password). |
    
4. Click on the Yammer icon to see that it loads correctly.

#### Task 2 -  Create a conditional access policy

Azure Active Directory conditional access is an advanced feature of Azure AD that allows you to specify detailed policies that control who can access your resources. Using Conditional Access, you can protect your applications by limiting users' access based on things like groups, device type, location, and role.

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory blade, under **Manage**, select **Security**.

4. On the Security blade, in the left navigation, select **Conditional access**.

5. On the top menu, select **+ New policy** from the drop-down select **Create a new policy**.

    ![Screen image displaying the Conditional Access blade with New policy highlighted](./media/lp2-mod1-conditional-access-new-policy.png)

6. In the **Name** box, enter **Block Yammer for DebraB**.

    **Note** - Using this naming to help you quickly recognize the policy and its function.

7. Under **Assignments**, select **Users or workload identities**.

8. On the Include tab, select the **Users and groups** check box.

9. In the Select pane, select **DebraB** account and then select **Select**.

10. Select **Cloud apps or actions**.

11. Verify **Cloud apps** is selected and then select **Select apps**.

12. In the Select pane, search for **Yammer** and select **Office 365 Yammer** and then select **Select**.

13. Under **Access controls**, select **Grant**.

14. In the Grant pane, select **Block access** and then select **Select**.

    **Note** - This policy is being configure for the exercise only and is being used to quickly demonstrate a conditional access policy.

15. Under **Enable policy**, select **On**, and then select **Create**.

    ![Screen image displaying a new conditional access policy with policy settings highlighted](./media/lp2-mod3-create-conditional-access-policy.png)

#### Task 3 - Test the conditional access policy

You should test your conditional access policies to ensure they working as expected.

1. Open a new 'Inprivate' browser tab and then browse to [https://www.yammer.com/office365](https://www.yammer.com/office365).
     - When prompted, log in as DebraB:

    | Setting | Value |
    | :--- | :--- |
    | Username | **DebraB@** `<<your lab domain>>.onmicrosoft.com` |
    | Password | Enter the admin password of the tenant(Refer the Lab Resources tab to retrieve the tenant's admin password). |
      
2. Verify you are prevented from successfully access Microsoft Yammer.

    ![Screen image displaying a the blocked resource access due to an enabled conditional access policy](./media/lp2-mod3-test-conditional-access-policy.png)

3. If you are signed in, close the tab, wait 1 minute, and then retry.
    
     **Note** - If your are auto-logged into Yammer as DebraB, then you will need to manually log out.  You credentials / access were cached.  Once you log out and sign-in, your Yammer session should deny access.

4. Close the tab and return to the Conditional Access blade.

5. Select the **Yammer conditional access** policy.

6. Under **Enable policy**, select **Off** and then select **Save**.

# Lab 16 - Configure authentication session controls

## Lab scenario

As part of your company's larger security configuration, you must test a conditional access policy that can be used to control sign in frequency.

#### Estimated time: 10 minutes

### Exercise 1 - Configure sign in frequency controls using a conditional access policy

#### Task - User the Azure Portal to configure conditional access

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory blade, under **Manage**, select **Security**.

4. On the Security blade, in the left navigation, select **Conditional access**.

5. On the top menu, select **+ New policy** from the drop-down select **Create a new policy**.

    ![Screen image displaying the Conditional Access blade with New policy highlighted](./media/lp2-mod1-conditional-access-new-policy.png)

6. In the **Name** box, enter **Sign in frequency**.

7. Under **Assignments**, select **Users or workload identities**.

8. On the Include tab, select the **Users and groups** check box.

9. In the Select pane, select your **Grady Archie** account and then select **Select**.

10. Select **Cloud apps or actions**.

11. Verify **Cloud apps** is selected and then select **Select apps**.

12. In the Select pane, select **Office 365** and then select **Select**.

13. Under **Access controls**, select **Session**.

14. In the Session pane, select **Sign-in frequency**.

15. In the value box, enter **30**.

16. Select the units menu, select **Days**, and then select **Select**.

17. Under **Enable policy**, select **Report-only**, and then select **Create**.

    ![Screen image displaying a new conditional access policy with policy settings highlighted](./media/lp2-mod3-create-session-conditional-access-policy.png)

   **NOTE** - Report-only mode is a new Conditional Access policy state that allows administrators to evaluate the impact of Conditional Access policies before enabling them in their environment. With the release of report-only mode:
    
    - Conditional Access policies can be enabled in report-only mode.
    - During sign-in, policies in report-only mode are evaluated but not enforced.
    - Results are logged in the Conditional Access and Report-only tabs of the Sign-in log details.
    - Customers with an Azure Monitor subscription can monitor the impact of their Conditional Access policies using the Conditional Access insights workbook.
