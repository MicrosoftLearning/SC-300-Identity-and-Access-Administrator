---
lab:
    title: '23 - Grant tenant-wide admin consent to an application'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 23: Grant tenant-wide admin consent to an application

## Lab scenario

For applications your organization has developed or for those that are registered directly in your Azure AD tenant, you can grant tenant-wide admin consent from App registrations in the Azure portal.

#### Estimated time: 15 minutes

### Exercise 1 - Admin Consent

#### Task 1 - Grant admin consent in App registrations

   **Warning** - Granting tenant-wide admin consent to an application will grant the app and the app's publisher access to your organization's data. Carefully review the permissions the application is requesting before granting consent.

The Global Administrator role is required in order to provide admin consent for application permissions to the Microsoft Graph API.

1. In a previous exercise, you created an app named Demo app. If necessary, in Microsoft Azure, browse to **Azure Active Directory**, then select **App registrations**, and then select **Demo app**.


2. On the **Demo app** page, locate and copy and save each **Application (client) ID** and **Directory (tenant) ID** values so that you can use them later.

    >**Note**: **Demo app** is created in the previous labs. Please complete these labs before this lab.

    ![Screen image displaying the Demo app page with the directory ID highlighted](./media/lp3-mod3-demo-app-directory-id.png)

3. In the left navigation, under **Manage**, select **API permissions**.

4. Under **Configured permissions**, select **Grant admin consent**.

    ![Screen image displaying the API permission page with Grant admin consent for Contoso highlighted](./media/lp3-mod3-api-permissions-admin-consent.png)

5. Review the dialogue box, and then select **Yes.**

   **Warning** - Granting tenant-wide admin consent through App registrations will revoke any permissions that had previously been granted tenant-wide. Permissions previously granted by users on their own behalf will not be affected.

#### Task 2 - Grant admin consent in Enterprise apps

You can grant tenant-wide admin consent through Enterprise applications if the application has already been provisioned in your tenant.

1. In Microsoft Azure, browse to **Azure Active Directory > Enterprise applications > Demo app.**

2. On the **Demo app** page, in the left navigation, under **Security,** select **Permissions.**

3. Under **Permissions,** select **Grant admin consent.**

    ![Screen image displaying the Demo app permissions page with Grant admin consent for Contoso highlighted](./media/lp3-mod3-grant-admin-consent-in-enterprise-app.png)

   **Warning** - Granting tenant-wide admin consent through App registrations will revoke any permissions that had previously been granted tenant-wide. Permissions previously granted by users on their own behalf will not be affected.

4. When prompted, sign in using your Global Administrator account.

5. In the **Permissions requested** dialog box, review the information and then select **Accept**.


### Exercise 2 - Azure AD Identity Governance settings

#### Task 1 - Manage the lifecycle of external users in Azure AD Identity Governance settings

You can select what happens when an external user, who was invited to your directory through an access package request being approved, no longer has any access package assignments. This can happen if the user relinquishes all their access package assignments, or their last access package assignment expires. By default, when an external user no longer has any access package assignments, they are blocked from signing in to your directory. After 30 days, their guest user account is removed from your directory.

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator.

2. An account with Global administrator or User administrator is required to complete these tasks.

3. Open Azure Active Directory and the select **Identity Governance**.

4. In the left navigation menu, under **Entitlement management**, select **Settings**.

5. On the top menu, select **Edit**.

    ![Screen image displaying the Identity governance settings page with manage the lifecycle of external users highlighted.](./media/lp4-mod1-manage-lifcycle-of-ext-users.png)

6. In the **Manage the lifecycle of external users** section, review the different settings for external users.

7. When an external user loses their last assignment to any access packages, if you want to block them from signing in to this directory, set the **Block external user from signing in to this directory** to **Yes**.

    **Note** - If a user is blocked from signing in to the directory, the user will be unable to re-request the access package or request additional access in this directory. Do not configure blocking them from signing in if they will subsequently need to request access to other access packages.

9. Once an external user loses their last assignment to any access packages, if you want to remove their guest user account in this directory, set **Remove external** user to **Yes**.

    **Note** - Entitlement management only removes accounts that were invited through entitlement management. Also, note that a user will be blocked from signing in and removed from this directory even if that user was added to resources in this directory that were not access package assignments. If the guest was present in this directory prior to receiving access package assignments, they will remain. However, if the guest was invited through an access package assignment, and after being invited was also assigned to a OneDrive for Business or SharePoint Online site, they will still be removed.

10. If you want to remove the guest user account in this directory, you can set the number of days before it is removed. If you want to remove the guest user account as soon as they lose their last assignment to any access packages, set **Number of days before removing external user from this directory** to **0**.

11. If you’ve made any changes, select **Save**.
