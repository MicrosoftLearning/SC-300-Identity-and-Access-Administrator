---
lab:
    title: '15 - Implement and test a conditional access policy'
    learning path: '02'
    module: 'Module 03 -Plan, implement, and administer conditional access'
---

# Lab 15 - Implement and test a conditional access policy

## Lab scenario

Your organization needs to be able to limit user access to its internal applications. You must deploy an Azure Active Directory conditional access policy.

#### Estimated time: 12 minutes

## Exercise 1 - Set a conditional access policy to block DebraB from accessing Yammer

### Task 1 -- Confirm DebraB has access to Yammer

1. Launch a new InPrivate browser window.
2. Connect to [https://www.office.com](https://www.office.com) 
3. When prompted, log in as DebraB:

    | Setting | Value |
    | :--- | :--- |
    | Username | **DebraB@** `<<your lab domain>>.onmicrosoft.com` |
    | Password | **pass@word123** |
    
4. Click on the Yammer icon to see that it loads correctly.

## Task 2 -  Create a conditional access policy

Azure Active Directory conditional access is an advanced feature of Azure AD that allows you to specify detailed policies that control who can access your resources. Using Conditional Access, you can protect your applications by limiting users' access based on things like groups, device type, location, and role.

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory blade, under **Manage**, select **Security**.

4. On the Security blade, in the left navigation, select **Conditional access**.

5. On the top menu, select **+ New policy**.

    ![Screen image displaying the Conditional Access blade with New policy highlighted](./media/lp2-mod1-conditional-access-new-policy.png)

6. In the **Name** box, enter **Block Yammer for DebraB**.

    **Note** - Using this naming to help you quickly recognize the policy and its function.

7. Under **Assignments**, select **Users and groups**.

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

## Task 3 - Test the conditional access policy

You should test your conditional access policies to ensure they working as expected.

1. Open a new 'Inprivate' browser tab and then browse to [https://www.yammer.com/office365](https://www.yammer.com/office365).
     - When prompted, log in as DebraB:

    | Setting | Value |
    | :--- | :--- |
    | Username | **DebraB@** `<<your lab domain>>.onmicrosoft.com` |
    | Password | **pass@word123** |
      
2. Verify you are prevented from successfully access Microsoft Yammer.

    ![Screen image displaying a the blocked resource access due to an enabled conditional access policy](./media/lp2-mod3-test-conditional-access-policy.png)

3. If you are signed in, close the tab, wait 1 minute, and then retry.
    
     **Note** - If your are auto-logged into Yammer as DebraB, then you will need to manually log out.  You credentials / access were cached.  Once you log out and sign-in, your Yammer session should deny access.

4. Close the tab and return to the Conditional Access blade.

5. Select the **Yammer conditional access** policy.

6. Under **Enable policy**, select **Off** and then select **Save**.
