---
lab:
    title: '14 - Enable Azure AD multi-factor authentication'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 14 - Working with security defaults

## Lab scenario

You must configure the Azure Active Directory security default settings in your organization.
    **This is a completely optional lab!!**  You can turn on / off Security Defaults, just to find out where the menu option is.  But the key points to remember are from the training.  Note that if you turn on Security Defaults, and do not disable it, later labs involving Conditional Access will not work.

#### Estimated time: 7 minutes

### Exercise - Prework

To be able to enable Security Defaults, you have to delete or disable any existing Conditional Access policies.  Reminder that in a previous lab we built a policy to enforce MFA for Delia.  You will need to disable that before you can perform the below steps.

1. Log into the Azure portal.
2. Open Azure Active Directory.
3. From the Security section of the menu select **Security** then select **Conditional Access**.
4. Select on any Conditional Access policy that is set to On or Report-Only and change them to Off.

### Exercise 1 - Enabling Security Defaults

#### Task 1 - Turn on security defaults

To enable security defaults in your directory:

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Select the **Show portal menu** hamburger icon and then select **Azure Active Directory**.

    ![Azure portal menu with Azure Active Directory selected](./media/azure-portal-menu-aad.png)

3. In the left navigation, in the Manage section, select **Properties**.

4. At the bottom of the Properties blade, select **Manage Security defaults**.

5. Set the **Enable security defaults** toggle to **Yes**.

6. This may already be enabled.

7. Select **Save**.

#### Task 2 - Disabling security defaults

Organizations that choose to implement Conditional Access policies that replace security defaults must disable security defaults.

To disable security defaults in your directory:

1. Browse to the [https://portal.azure.com](https://portal.azure.com/) and sign in using a Global administrator account for the directory.

2. Select the **Show portal menu** hamburger icon and then select **Azure Active Directory**.

3. At the bottom of the Properties blade, select **Manage Security defaults**.

4. Set the **Enable security defaults** toggle to **No**.

    ![Screen image of security defaults being disabled and selection of the required reason for disabling. In this case, the organization is using Conditional Access.](./media/security-defaults-disable-before-conditional-access.png)

5. Select **Save**.
