---
lab:
    title: '23 - Grant tenant-wide admin consent to an application'
    learning path: '03'
    module: 'Module 03 - Implement app registrations'
---

# Lab 23: Grant tenant-wide admin consent to an application

## Lab scenario

For applications your organization has developed or for those that are registered directly in your Azure AD tenant, you can grant tenant-wide admin consent from App registrations in the Azure portal.

#### Estimated time: 10 minutes

## Grant admin consent in App registrations

> **Warning**
> Granting tenant-wide admin consent to an application will grant the app and the app's publisher access to your organization's data. Carefully review the permissions the application is requesting before granting consent.

The Global Administrator role is required in order to provide admin consent for application permissions to the Microsoft Graph API.

1. In a previous exercise, you created an app named Demo app. If necessary, in Microsoft Azure, browse to **Azure Active Directory > App registrations > Demo app.**

1. On the **Demo app** blade, locate and copy and save each **Application (client) ID** and **Directory (tenant) ID** values so that you can use them later.

    ![Screen image displaying the Demo app blade with the directory ID highlighted](./media/lp3-mod3-demo-app-directory-id.png)

1. In the left navigation, under **Manage**, select **API permissions**.

1. Under **Configured permissions**, select **Grant admin consent**.

    ![Screen image displaying the API permission page with Grant admin consent for Contoso highlighted](./media/lp3-mod3-api-permissions-admin-consent.png)

1. Review the dialogue box, and then select **Yes.**

    > **Warning**
    > Granting tenant-wide admin consent through App registrations will revoke any permissions that had previously been granted tenant-wide. Permissions previously granted by users on their own behalf will not be affected.

## Grant admin consent in Enterprise apps

You can grant tenant-wide admin consent through Enterprise applications if the application has already been provisioned in your tenant.

1. In Microsoft Azure, browse to **Azure Active Directory > Enterprise applications > Demo app.**

1. On the **Demo app** blade, in the left navigation, under **Security,** select **Permissions.**

1. Under **Permissions,** select **Grant admin consent.**

    ![Screen image displaying the Demo app permissions page with Grant admin consent for Contoso highlighted](./media/lp3-mod3-grant-admin-consent-in-enterprise-app.png)

    > [!WARNING]
    > Warning
    > Granting tenant-wide admin consent through App registrations will revoke any permissions that had previously been granted tenant-wide. Permissions previously granted by users on their own behalf will not be affected.

1. When prompted, sign in using your Global Administrator account.

1. In the **Permissions requested** dialog box, review the information and then select **Accept**.
