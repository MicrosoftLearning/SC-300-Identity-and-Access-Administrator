---
lab:
    title: '07 - Add Hybrid Identity with Azure AD Connect'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 07: Add Hybrid Identity with Azure AD Connect

## Lab scenario

Your company works has Active Directory Domain Services on-premises.  They would like to continue to use on-premises Active Directory as their identity and access management solution, but also require the ability for users to access cloud applications with the same username and password.

#### Estimated time: 5 minutes

### **TODO** Exercise 1 - Add guest users to the directory

#### Task - Add the guest user

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a user who is assigned a limited administrator directory role or the Guest Inviter role.

2. Select **Azure Active Directory**.

3. Under **Manage**, select **Users**.

4. Select **New guest user**.

    ![Screen image displaying the Users blade with the New guest user menu option selected](./media/lp1-mod3-new-guest-user-menu-selection.png)

5. On the New user page, select **Invite user** and then add your information as the guest user.

    **NOTE** - Group email addresses are not supported; enter the email address for an individual. Also, some email providers allow users to add a plus symbol (+) and additional text to their email addresses to help with things like inbox filtering. However, Azure AD does not currently support plus symbols in email addresses. To avoid delivery issues, omit the plus symbol and any characters following it up to the @ symbol.

6. When complete, select **Invite**.

7. On the Users blade, verify your account is listed and, in the **User type** column, verify **Guest** is shown.

After you send the invitation, the user account is automatically added to the directory as a guest.

