---
lab:
    title: '07 - Change user account license assignments'
    learning path: '01'
    module: 'Module 02 - Create, configure, and manage identities'
---

# Lab 07: Change user account license assignments

## Lab scenario

Some user accounts in your organization will not be provided all available products in their assigned license or will need updates or additions to their license assignment. You need to ensure you are able to update a user account's license assignment in Azure AD.

#### Estimated time: 5 minutes

## Create a new user in Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

1. In the left navigation, under **Mange**, select **Users**.

1. In the Users blade, on the menu, select **New user**.

1. Create a user using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | User name| Dominique|
    | Name| Dominique Koch|
    | First name| Dominique|
    | Last name| Koch|
    | Password| Pass@word1|
    | Usage location| *Select your preferred usage location*|

    >Warning
    >To assign a license to a user, the user must assigned a usage location.

1. When complete, verify the account for Chris Green is shown in the **All users** list.

## Update user license assignments

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

1. In the left navigation, under **Manage**, select **Users**

1. In the Users blade, select **Dominique Koch**.

1. In the left navigation, select **Licenses**.

1. Select the **+Assignments** button. 

1. On the Update license assignments blade, select the check box for a single or multiple licenses.

    ![Screen image displaying the Update license assignments page and license options highlighted](./media/lp1-mod2-assign-user-license-options.png)

1. When complete, select **Save**.
