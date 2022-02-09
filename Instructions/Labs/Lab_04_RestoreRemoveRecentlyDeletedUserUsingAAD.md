---
lab:
    title: '04 - Restore a deleted user'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 04: Restore a deleted user

## Lab scenario

It may happen that an account is deleted and then needs to be recovered. You need to verify you can recover an account that has been deleted recently.

#### Estimated time: 5 minutes

### Exercise 1 - Remove a user from Azure Active Directory

#### Task 1 - Remove a User

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Manage**, select **Users**.

3. In the **Users** list, select the check box for a user that will be deleted. For example, select **Chris Green**.

    **Tip** - Selecting users from the list allows you to manage multiple users at the same time. If you select the user, to open that user’s blade, you will only be managing that individual user.

    ![Screen image displaying the All users users list with one user check box selected and another check box highlighted indicating the ability to select multiple users from the list.](./media/lp1-mod2-remove-user.png)

4. With the user account selected, on the menu, select **Delete user**.

5. Review the dialog box and then select **OK**.

#### Task 2 - Restore a deleted user

1. In the Users blade, in the left navigation, select **Deleted users**.

2. Review the list of deleted users and select the user you just deleted.

    **Important** - By default, deleted user accounts are permanently removed from Azure Active Directory automatically after 30 days.

3. On the menu, select **Restore user**.

4. Review the dialog box and then select **OK**.

5. In the left navigation, select **All users**.

6. Verify the user has been restored.
