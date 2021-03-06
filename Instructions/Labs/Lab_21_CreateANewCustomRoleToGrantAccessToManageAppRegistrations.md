---
lab:
    title: '21 - Create a new custom role to grant access to manage app registrations'
    learning path: '03'
    module: 'Module 01 - Plan and design the integration of enterprise apps for SSO'
---

# Lab 21 - Implement access management for apps

## Lab scenario

You need to create a new custom role for app management. This new role should be limited to only the specific permissions required to perform credential management.

#### Estimated time: 5 minutes

## Create a new custom role to grant access to manage app registrations

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) using a Global administrator account.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the Azure Active Directory blade, under **Manage**, select **Roles and administrators**.

1. On the Roles and administrators blade, on the menu, select **New custom role**.

    ![Screen image displaying the Roles and administrators blade with the New custom role menu option highlighted](./media/lp3-mod1-new-custom-role.png)

1. In the New custom role blade, on the Basics tab, in the name box, enter **My custom app role**.

1. Review the remaining options and then select **Next**.

1. On the Permissions tab, review the available permissions.

1. In the **Search by permission name or description** box, enter **credentials**.

1. In the results, select the **Manage** permissions and then select **Next**.

    ![Screen image displaying the New custom role Permissions tab with search, manage permissions, and Next highlighted](./media/lp3-mod1-custom-role-permissions.png)

1. Review the changes and then select **Create**.
