---
lab:
    title: '04 - Restore a deleted user'
    learning path: '01'
    module: 'Module 02 - Create, configure, and manage identities'
---

# Lab 04: Restore a deleted user

## Lab scenario

It may happen that an account is deleted and then needs to be recovered. You need to verify you can recover an account that has been deleted recently.

#### Estimated time: 5 minutes

## Remove a user from Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

1. In the left navigation, under **Manage**, select **Users**.

1. In the **Users** list, select the check box for a user that will be deleted. For example, select **Chris Green**.

    >[!Tip]
    >Selecting users from the list allows you to manage multiple users at the same time. If you select the user, to open that user’s blade, you will only be managing that individual user.

    ![Screen image displaying the All users users list with one user check box selected and another check box highlighted indicating the ability to select multiple users from the list.](./media/lp1-mod2-remove-user.png)

1. With the user account selected, on the menu, select **Delete user**.

1. Review the dialog box and then select **OK**.

## Restore a deleted user

1. In the Users blade, in the left navigation, select **Deleted users**.

1. Review the list of deleted users and select the user you just deleted.

    >[!Important]
    >By default, deleted user accounts are permanently removed from Azure Active Directory automatically after 30 days.

1. On the menu, select **Restore user**.

1. Review the dialog box and then select **OK**.

1. In the left navigation, select **All users**.

1. Verify the user has been restored.
