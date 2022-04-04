---
lab:
    title: '21 - Create a new custom role to grant access to manage app registrations'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 21 - Create a custom role to manage app registration

## Lab scenario

You need to create a new custom role for app management. This new role should be limited to only the specific permissions required to perform credential management.

#### Estimated time: 5 minutes

### Exercise 1 - Manage app registration with a custom role

#### Task - Create a new custom role to grant access to manage app registrations

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) using a Global administrator account.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory blade, under **Manage**, select **Roles and administrators**.

4. On the Roles and administrators blade, on the menu, select **+New custom role**.

    ![Screen image displaying the Roles and administrators blade with the New custom role menu option highlighted](./media/lp3-mod1-new-custom-role.png)

5. In the New custom role blade, on the Basics tab, in the name box, enter **My custom app role**.

6. Review the remaining options and then select **Next**.

7. On the Permissions tab, review the available permissions.

8. In the **Search by permission name or description** box, enter **credentials**.

9. In the results, select the **Manage** permissions and then select **Next**.

    ```
       microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials  -   Manage password single sign-on credentials or service principals.
       microsoft.directory/servicePrincipals/synchronizationCredentials/manage    -   Manage application provisioning secrets and credentials.
    ```

    ![Screen image displaying the New custom role Permissions tab with search, manage permissions, and Next highlighted](./media/lp3-mod1-custom-role-permissions.png)

    **Why pick those two** - For application provisionsing these two items are the bare minimum permissions needed to enable and enforce single sign-on for the application or service principal being created; and be able to assign the enterise application to a set of users or groups.  Other permissions could also be granted.  You can get a full list of available permissions at `https://docs.microsoft.com/azure/active-directory/roles/custom-enterprise-app-permissions`.

10. Review the changes and then select **Create**.
