---
lab:
    title: '20 - Implement access management for apps'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 20 - Implement access management for apps

### Login type = Microsoft 365 admin

## Lab scenario

Your organization requires that only specific users or groups have access to enterprise applications. You must assign a user to a specific application.

#### Estimated time: 5 minutes

### Exercise 1 - Configure an Enterprise App

#### Task 1 - Add an app to your Microsoft Entra tenant

1. Sign in to the [https://entra.microsoft.com](https://entra.microsoft.com) using the provided Administrator account.

2. Look at the menu on the left side of the screen.

3. On the Identity menu, under **Applications**, select **Enterprise applications**.

4. In the Enterprise applications pane, select **+ New application**.

    ![Screen image displaying the Enterprise applications page with New application highlighted](./media/lp3-mod1-new-enterprise-application.png)

5. In the Browse Microsoft Entra Gallery page, in the **Search application** box, enter **GitHub**.

    ![Screen image displaying the Browse Microsoft Entra Gallery page with the search box highlighted](./media/lp3-mod1-azure-ad-gallery-search.png)

6. In the results, select **GitHub Enterprise Cloud – Enterprise Account**.

7. In the **GitHub Enterprise Cloud – Enterprise Account**, review the settings and then select **Create**.

8. Once created, you will be redirected to the GitHub Enterprise Cloud – Enterprise Account page.

#### Task 2 - Assign users to an app

1. On the GitHub Enterprise Cloud – Enterprise Account page, on the Overview page, under **Getting Started**, select **1. Assign users and groups**.

2. Alternatively, in the left navigation, under **Manage**, you can select **Users and groups**.

3. On the Users and groups page, on the menu, select **+ Add user/group**.

4. On the Add Assignment page, select **None selected** in the **Users and groups** section.

5. In the Users and groups pane, select Adele Vance and your MOD administrator account.

6. Select **Select**.

    ![Screen image displaying adding a user account assignment to an app with the Select button highlighted ](./media/lp3-mod1-add-app-assignment.png)

7. Select **Assign**.

