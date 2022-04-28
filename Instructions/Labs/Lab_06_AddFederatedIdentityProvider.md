---
lab:
    title: '06 - Add a federated identity provider'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Add a federated identity provider

## Lab scenario

Your company works with many vendors and, on occasion, you need to add some vendor accounts to your directory as a guest and allow them to use their Google account to sign-in.

#### Estimated time: 10 minutes

### Exercise 1 - Configure identity providers

#### Task - Configure Google as an identity provider

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a user who is assigned a limited administrator directory role or the Guest Inviter role.

2. Select **Azure Active Directory**.

3. Under **Manage**, select **External Identities**.

4. Microsoft provides a direct federation for **Google** as an identity provider.  This can be initiated by selecting **+ Google** from the **External Identities | All identity providers** blade
 
5. After selecting + Google, another blade will open with additional information that is required to configure Google as an identity provider.  To obtain this information, the Microsoft Azure Active Directory account must be configured within Google. 

    **NOTE** - Use this link to complete the steps for finding the Google Client ID and Client secret.
    https://docs.microsoft.com/azure/active-directory/external-identities/google-federation

6. This completes the configuration of Google as an identity provider.

Facebook can also easily be configured as an identity provider. These steps can be accessed here: https://docs.microsoft.com/azure/active-directory/external-identities/facebook-federation.

