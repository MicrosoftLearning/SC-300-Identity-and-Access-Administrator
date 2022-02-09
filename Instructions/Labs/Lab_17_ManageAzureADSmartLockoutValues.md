---
lab:
    title: '17 - Manage Azure AD smart lockout values'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 17 - Manage Azure AD smart lockout values

## Lab scenario

You must configure the additional password protection settings for your organization.

#### Estimated time: 5 minutes

### Exercise 1 - Manage Azure AD smart lockout values

#### Task - Add Smart Lockouts

Based on your organizational requirements, you can customize the Azure AD smart lockout values. Customization of the smart lockout settings, with values specific to your organization, requires Azure AD Premium P1 or higher licenses for your users.

1. Browse to [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory blade, under **Manage**, select **Security**.

4. On the Security blade, in the left navigation, select **Authentication methods**.

5. In the left navigation, select **Password protection**.

    ![Screen image displaying the Authentication methods blade and the highlighted selections to browse to Password authentication](./media/lp2-mod3-browse-to-password-protection.png)

6. In the Password protection settings, in the **Lockout duration in seconds** box, set the value to **120**.

7. Next to **Mode**, select **Enforced**.

8. Save your changes.

    **NOTE** - When the smart lockout threshold is triggered, you will get the following message while the account is locked:
    - Your account is temporarily locked to prevent unauthorized use. Try again later, and if you still have trouble, contact your admin.
