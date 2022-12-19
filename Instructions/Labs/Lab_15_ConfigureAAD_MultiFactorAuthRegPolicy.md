---
lab:
    title: '15 - Configure an Azure AD multi-factor authentication registration policy'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 15 - Configure an Azure AD multi-factor authentication registration policy

## Lab scenario

Azure AD multi-factor authentication provides a means to verify who you are using more than just a username and password. It provides a second layer of security to user sign-ins. For users to be able to respond to MFA prompts, they must first register for Azure AD Multi-Factor Authentication. You must configure your Azure AD organization's MFA registration policy to be assigned to all users.


#### Estimated time: 10 minutes

### Exercise 1 - Set up MFA registration policy

#### Task 1 - Policy configuration

**Note**: Azure AD Identity Protection requires Azure AD Premium P2 to be activated.

1. Sign in to the [https://portal.azure.com]( https://portal.azure.com) using a Global administrator account.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the Azure Active Directory page, under **Manage**, select **Security**.

4. On the Security page, in the left navigation, select **Identity protection**.

5. In the Identity protection page, in the left navigation, select **MFA registration policy**.

    ![Screen image displaying the MFA registration policy page with browsing path highlighted](./media/lp2-mod4-browse-to-mfa-registration-policy.png)

6. Under **Assignments**

7. Under **Assignments**, select **All users** and review the available options.

8. You can select from **All users** or **Select individuals and groups** if limiting your rollout.

9. Additionally, you can choose to exclude users from the policy.

10. Under **Controls**, notice that the **Require Azure AD MFA registration** is selected and cannot be changed.

11. Under **Enforce Policy**, select **On** and then select **Save**.


This will require the user to complete the MFA registration the next time they attempt to login.

1. From a private browser, navigate to <login.microsoftonline.com>. Enter a user name and password from the tenant.  Note the additional security information requirements that the user is asked to enter.
