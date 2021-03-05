---
lab:
    title: '20 - Implement access management for apps'
    learning path: '03'
    module: 'Module 01 -Plan and design the integration of enterprise apps for SSO'
---

# Lab 20 - Implement access management for apps

## Lab scenario

Your organization requires that only specific users or groups have access to enterprise applications. You must assign a user to a specific application.

#### Estimated time: 5 minutes

## Add an app to your Azure AD tenant

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) using a Global administrator account.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the Azure Active Directory blade, under **Manage**, select **Enterprise applications**.

1. In the Enterprise applications pane, select **+ New application**.

    ![Screen image displaying the Enterprise applications blade with New application highlighted](./media/lp3-mod1-new-enterprise-application.png)

1. In the Browse Azure AD Gallery (Preview) blade, in the **Search application** box, enter **GitHub**.

    ![Screen image displaying the Browse Azure AD Gallery (Preview) blade with the search box highlighted](./media/lp3-mod1-azure-ad-gallery-search.png)

1. In the results, select **GitHub Enterprise Cloud – Enterprise Account**.

1. In the **GitHub Enterprise Cloud – Enterprise Account**, review the settings and then select **Create**.

1. Once created, you will be redirected to the GitHub Enterprise Cloud – Enterprise Account blade.

## Assign users to an app

1. On the GitHub Enterprise Cloud – Enterprise Account blade, on the Overview page, under **Getting Started**, select **1. Assign users and groups**.

1. Alternatively, in the left navigation, under **Manage**, you can select **Users and groups**.

1. On the Users and groups page, on the menu, select **+Add user/group**.

1. On the Add Assignment blade, select **Users and groups**.

1. In the Users and groups pane, select your administrator account and then select **Select**.

    ![Screen image displaying adding a user account assignment to an app with the Select button highlighted ](./media/lp3-mod1-add-app-assignment.png)

1. Select **Assign**.
