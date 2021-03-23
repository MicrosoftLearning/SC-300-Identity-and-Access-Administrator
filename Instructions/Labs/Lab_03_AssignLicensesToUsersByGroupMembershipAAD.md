---
lab:
    title: '03 - Assigning licenses using group membership'
    learning path: '01'
    module: 'Module 02 - Create, configure, and manage identities'
---

# Lab 03: Assigning licenses using group membership

## Lab scenario

Your organization has decided to use security groups in Azure AD to manage licenses. You need to configure a new security and assign a license to that group and verify group member license's have been updated.

#### Estimated time: 10 minutes

## Create a new user in Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview) and sign in as a Global Administrator.

1. In the left navigation, under **Mange**, select **Users**.

1. In the Users blade, on the menu, select **New user**.

1. Create a user using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | User name| Chris|
    | Name| Chris Green|
    | First name| Chris|
    | Last name| Green|
    | Password| Pass@word1|

1. When complete, verify the account for Chris Green is shown in the **All users** list.

## Create a security group in Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

1. In the left navigation, under **Mange**, select **Groups**.

1. In the Groups blade, on the menu, select **New group**.

1. Create a group using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | Group type| Security|
    | Group name| Marketing|
    | Membership type| Assigned|
    | Owners| *Assign your own administrator account as the group owner*|
    | Members| Chris Green|

    ![Screen image displaying the New Group blade with Group type, Group name, Owners, and Members highlighted](./media/lp1-mod2-create-group.png)

1. When complete, verify the group named **Marketing** is shown in the **All groups** list.

## Assign a license to a group

1. In the **All groups** list, select **Marketing**.

1. In the Marketing blade, under **Mange**, select **Licenses**.

1. On the menu, select **Assignments**.

1. In the update license assignments blade, under **Select licenses**, review the list of available licenses and then select the check box for one of the licenses.

1. Under **Review license options**, review the available options for the license you have selected.

    >[!Tip]
    >When multiple licenses are selected, you can use the Review license options menu to select a specific license and view the license option for that license.

    ![Screen image displaying licenses selected and assigned to a group. The review license menu is also selected displaying multiple selection options.](./media/lp1-mod2-assign-license-group.png)

1. Select **Save**.
