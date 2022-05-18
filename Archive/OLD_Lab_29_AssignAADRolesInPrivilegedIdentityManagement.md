---
lab:
    title: '29 - Configure Privileged Identity Management for Azure AD roles'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 29: Assign Azure AD roles in Privileged Identity Management

## Lab scenario

With Azure Active Directory (Azure AD), a Global administrator can make permanent Azure AD admin role assignments. These role assignments can be created using the Azure portal or using PowerShell commands.

The Azure AD Privileged Identity Management (PIM) service also allows Privileged role administrators to make permanent admin role assignments. Additionally, Privileged role administrators can make users eligible for Azure AD admin roles. An eligible administrator can activate the role when they need it, and then their permissions expire once they're done.

#### Estimated time: 15 minutes

### Exercise 1 - PIM with Azure AD roles

#### Task 1 - Assign a role

Follow these steps to make a user eligible for an Azure AD admin role.

1. Sign in to [https://portal.azure.com](https://portal.azure.com) using a Global Administrator account.

2. Search for and then select **Azure AD Privileged Identity Management.**

3. In the Privileged Identity Management blade, in the left navigation, select **Azure AD roles.**

4. On the Quick start page, in the left navigation, select **Roles**.

5. On the top menu, select **+ Add assignments.**

    ![Screen image displaying Azure AD roles with Add assignments menu highlighted](./media/lp4-mod3-pim-assign-role.png)

6. In the Add assignments blade, on the **Membership** tab, review the settings.

7. Select the **Select role** menu and then select **Compliance Administrator**.

8. You can use the **Search role by name** filter to help located a role.

9. Under **Select member(s),** select **No members selected**.

10. In the Select a member pane, select **Miriam Graham** and then select **Select**.

    ![Screen image displaying the select a member pane with a selected member highlighted](./media/lp4-mod3-pim-add-role-assignment.png)

11. In the Add assignments blade, select **Next**.

12. On the **Settings** tab, under **Assignment type**, review the available options. For this task, use the default setting.

    - Eligible assignments require the member of the role to perform an action to use the role. Actions might include performing a multi-factor authentication (MFA) check, providing a business justification, or requesting approval from designated approvers.
    - Active assignments do not require the member to perform any action to use the role. Members assigned as active have the privileges always assigned to the role.

13. Review the remaining settings and then select **Assign**.

#### Task 2 - Log in with Miriam

1. Open a new InPrivate browser window.
2. Connect to the Azure Portal (https://portal.azure.com).
3. If it opens with a user logged in, Select on their name in the upper-right corner and select **Sign in as a different account**.
4. Log in a Miriam.

   | Field | Value |
   | :--- | :--- |
   | Username | **MiriamG@** `<<your domain.onmicrosoft.com>>` |
   | Password |  Enter the tenant's admin password(Refer the Lab Resources tab to retrieve the tenant admin password) |

5. Close the **Welcome to Azure dialog**.
6. From the **Search resource, services, and docs** bar look for Azure Active Directory, and open the blade.
7. On the **Overview** page, look for the **My feed**.
8. Select **View Profile** under Miriam Graham's name; this with open Miriam's profile page.
9. Select **Assigned roles** then select **Eligible assignments**.
10. Notice that the **Compliance Administrator** role is now available to Miriam.

#### Task 3 - Activate your Azure AD roles

When you need to assume an Azure AD role, you can request activation by opening **My roles** in Privileged Identity Management.

1. From the **Search, resources, services, and docs** bar, look for Privileged.
2. Open the **Azure AD Privileged Identity Management** blade.
3. On the Privileged Identity Management blade, in the left navigation menu, select **My roles.**

4. In the My roles blade, review the list of eligible assignments.

    ![Screen image displaying My roles with eligible role assignments highlighted](./media/lp4-mod3-my-roles.png)

5. In the Compliance Administrator role row, select **Activate**.

6. In the Activate – Compliance Administrator pane, select **Additional verification required** and then follow the instructions to provide additional security verification. You are required to authenticate only once per session.

    ![Screen image displaying a popup to activate the compliance administrator](./media/lp4-mod3-pim-activate-role.png)

    **Verification** - Based on our current lab environment configuration, you will be required configure MFA and log in successfully.

7. After you have completed the additional security verification, in the Activate – Compliance Administrator pane, in the **Reason** box, enter the **This is my justification for activating this role**.

    **Important Note** - the principal of least prvilege, you should only activate the account for the amount of time you need it.  If the work needed to be done, only takes 1.5 hours, then set the duration to two hours.  Similarily, if you know that you won't be able to do the work until after 3pm, choose a Custom activation time.

8. Select **Activate**.

#### Task 4 - Assign a role with restricted scope

For certain roles, the scope of the granted permissions can be restricted to a single admin unit, service principal, or application. This procedure is an example if assigning a role that has the scope of an administrative unit.

1. Remember to close out the browser windows for MiriamG, then open the Azure Portal as your administrator account.
2. Browse to the Privileged Identity Management blade, and in the left navigation menu, select Azure **Azure AD roles.**
3. Select **Roles**.
4. In the Roles blade, on the top menu, select **+ Add assignments.**

5. In the Add assignments blade, select the **Select role** menu and then select **User administrator.**

6. Select the **Scope type** menu and review the available options. For now, you will use the **Directory** scope type.

   **Tip** - Go to [https://docs.microsoft.com/en-us/azure/active-directory/roles/admin-units-manage](https://docs.microsoft.com/en-us/azure/active-directory/roles/admin-units-manage) for more information about the administrative unit scope type.

7. As you did when assigning a role without a restricted scope, you would add members and complete the settings options. For now, select **Cancel**.

#### Task 5 - Update or remove an existing role assignment

Follow these steps to update or remove an existing role assignment.

1. In the Open Azure AD Privileged Identity Management > Azure AD roles blade, in the left navigation, select **Assignments**.

2. In **Assignments** list, for Compliance Administrator, review the options in the **Action** column.

    ![Screen image displaying the options listed in the action column of the Compliance Adminsitrator](./media/lp4-mod3-pim-edit-role-assignments.png)

3. Select **Update** and review the options available in the Membership settings pane. When complete, close the pane.

4. Select **Remove**.

5. In the **Remove** dialog box, review the information and then select **Yes**.
