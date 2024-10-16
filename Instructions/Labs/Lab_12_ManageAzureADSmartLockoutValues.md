---
lab:
    title: '12 - Manage Microsoft Entra smart lockout values'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 12 - Manage Microsoft Entra smart lockout values

### You will perform this lab with the tenant login - admind@LODM#####.onmicrosoft.com

## Lab scenario

You must configure the additional password protection settings for your organization.

#### Estimated time: 5 minutes

### Exercise 1 - Manage Microsoft Entra smart lockout values

#### Task - Add Smart Lockouts

Based on your organizational requirements, you can customize the Microsoft Entra smart lockout values. Customization of the smart lockout settings, with values specific to your organization, requires Microsoft Entra ID Premium P1 or higher licenses for your users.

1. Browse to [https://entra.microsoft.com](https://entra.microsoft.com) and sign in using a Global administrator account for the directory.

2. Open the portal menu and then select **Identity**.

3. On the Identity menu, open the **Protection** menu.

4. In the left navigation, select **Authentication methods**.

5. Then select **Password protection**.

    ![Screen image displaying the Authentication methods page and the highlighted selections to browse to Password authentication](./media/lp2-mod3-browse-to-password-protection.png)

6. In the Password protection settings, in the **Lockout duration in seconds** box, set the value to **120**.

7. Next to **Mode**, select **Enforced**.

8. Save your changes.

    **NOTE** - When the smart lockout threshold is triggered, you will get the following message while the account is locked:
    - Your account is temporarily locked to prevent unauthorized use. Try again later, and if you still have trouble, contact your admin.

9. This can be tested by choosing a user in your Microsoft Entra tenant, navigate in a private browser to <login.microsoftonline.com> and enter an incorrect password until the account gets notification that it is locked out.
