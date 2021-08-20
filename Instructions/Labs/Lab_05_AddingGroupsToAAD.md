---
lab:
    title: '05 - Adding groups to Azure AD'
    learning path: '01'
    module: 'Module 02 - Create, configure, and manage identities'
---

# Lab 05: Adding groups to Azure AD

## Lab scenario

Part of your duties as an Azure AD administrator is to create different types of groups. You need to create a new Microsoft 365 group for your organization's sales department.

#### Estimated time: 5 minutes

## Create an Microsoft 365 group in Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

1. In the left navigation, under **Manage**, select **Groups**.

1. In the Groups blade, on the menu, select **New group**.

1. Create a group using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | Group type| Microsoft 365|
    | Group name| Northwest Sales|
    | `Membership type| Assigned|
    | Owners| *Assign your own administrator account as the group owner*|
    | Members| *Assign a member of this group*|
1. Click **Create**

    ![Screen image displaying the New Group blade with Group type, Group name, Owners, and Members highlighted](./media/lp1-mod2-create-o365-group.png)

1. When complete, verify the group named **Northwest sales** is shown in the **All groups** list.
