---
lab:
    title: '11 - Assign Azure resource roles in Privileged Identity Management'
    learning path: '02'
    module: 'Module 02 - Implement an authentication and access management solution'
---

# Lab 11 - Assign Azure resource roles in Privileged Identity Management

### Login type = Azure Resource login

## Lab scenario

Microsoft Entra Privileged Identity Management (PIM) can manage the built-in Azure resource roles, as well as custom roles, including (but not limited to):

- Owner
- User Access Administrator
- Contributor
- Security Admin
- Security Manager

You need to make a user eligible for an Azure resource role.

#### Estimated time: 10 minutes

### Exercise 1 - PIM with Azure resources

#### Task 1 - Assign Azure resource roles

1. Sign in to [https://entra.microsoft.com](https://entra.microsoft.com) using the provided administrator account.

2. Search for and then select **Privileged Identity Management.**

3. In the Privileged Identity Management page, in the left navigation, select **Azure resources.**

**Lab Tip** - The next few steps are written for the Legacy Azure Resource experience.  You can switch to the old experience at the top of your screen. Or you can complete the exercise in the new experience without the step-by-step.

4. In the Subscriptions dropdown choose the MOC Subscription##### item. Then at bottom of the screen, select **Manage resources**.

5. In the Azure resources – Discovery page, select your subscription.

6. In the **Overview** page, review the information.

   ![Screen image displaying the recently added Azure resource](./media/lp4-mod3-pim-az-resource-overview.png)

   **Lab Tip** - due to the nature of the lab environment, you won't see any resources. Refer to the picture for a sample.

7. In the left navigation menu, under **Manage**, select **Roles** to see the list of roles for Azure resources.

8. On the top menu, select + **Add assignments**.

9. In the Add assignments page, select the **Select role** menu and then select **API Management Service Contributor.**

10. Under **Select member(s),** select **No member selected**.

11. In the Select a member or group, search for your admin roles **User1-######@LODSPRODMCA.onmicrosoft.com** from your organization that will be assigned the role.  Then chose **Select**.

12. Select **Next**.

13. On the **Settings** tab, under **Assignment type**, select **Eligible**.

   - **Eligible** assignments require the member of the role to perform an action to use the role. Actions might include performing a multi-factor authentication (MFA) check, providing a business justification, or requesting approval from designated approvers.

   - **Active** assignments do not require the member to perform any action to use the role. Members assigned as active have the privileges always assigned to the role.

14. Specify an assignment duration by changing the start and end dates and times.

15. When finished, select **Assign**.

16. After the new role assignment is created, a status notification is displayed.

#### Task 2 - Update or remove an existing resource role assignment

**Note** - Due to the security enforced on this lab environment, you cannot complete these steps.  Please review the steps in the user interface, but you won't be able to apply changes.  We are actively working on getting a work-around in place for this.

Follow these steps to update or remove an existing role assignment.

1. Open **Microsoft Entra Privileged Identity Management**.

2. Select **Azure resources**.

3. Select the subscription you want to manage to open its overview page.

4. Under **Manage**, select **Assignments**.

5. On the **Eligible assignments** tab, in the Action column, review the available options.

6. Select **Remove**.

7. In the **Remove** dialog box, review the information and then select **Yes**.
