---
lab:
    title: '06 - Add a federated identity provider'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Add a federated identity provider

## Lab scenario

Your company works with many vendors and, on occasion, you need to add some vendor accounts to your directory as a guest and allow them to use their Google account to sign-in.

#### Estimated time: 25 minutes

### Exercise 1 - Configure identity providers

#### Task 1 - Configure Google to be used as an identity provider

>**Note**: For this exercise, you will need a Gmail account on Google. You can create a new account or use an existing account.

# RobertS --> I like the lab and it worked for me (once I figured out my Google Account / Password).  However, we generally get a bunch of pushback in our labs when we ask them to use an existing account.  So we might want to make this an actual, create new GMail account and then follow the steps.

1. Go to the Google APIs at https://console.developers.google.com, and sign in with your Google account. We recommend that you use a shared team Google account.

1. Accept the terms of service if you're prompted to do so.

1. Create a new project: At the top of the page, select the project menu to open the Select a project page. Choose New Project.
# RobertS --> I assume you don't need Location set.  Mine defaulted to No Organization.  We should say leave the default or something, if not needed.

1. On the New Project page, give the project a name (for example, MyB2BApp), and then select **Create**.

1. Open the new project by selecting the link in the Notifications message box or by using the project menu at the top of the page.

1. In the left menu, select APIs & Services, and then select OAuth consent screen.

1. Under User Type, select External, and then select Create.

1. On the OAuth consent screen, under App information, enter an App name.
# RobertS --> I think we should suppy the App Name, or at least a stater name.

1. Under User support email, select an email address.

1. Under Authorized domains, select Add domain, and then add the microsoftonline.com domain.
# RobertS --> We have to give them the exact entry value, or as close to it as possible.  Is the value really always microsoftonline.com, if so we should mark it as code so it can be copy/pasted.  If it is supposed to be the Skillable Tenant domain name, then we can tell them to use that.  For my first test, I am just using MICROSOFTONLINE.COM as the lab step states. 

1. Under Developer contact information, enter an email address.
# RobertS --> I used my Skillable lab admin account.  It has a mailbox that we can check.

1. Select **Save and continue**.

1. In the left menu, select **Credentials**.

1. Select ** + Create credentials**, and then select **OAuth client ID**.
# RobertS --> I think the space after the double-asterik is causing this to fail to display bold in the labs.

1. In the Application type menu, select Web application. Give the application a suitable name, like Azure AD B2B. Under **Authorized redirect URIs**, add the following URIs:

    - https://login.microsoftonline.com
    - https://login.microsoftonline.com/te/**tenant ID**/oauth2/authresp
    (where <tenant ID> is your tenant ID)
    - https://login.microsoftonline.com/te/**tenant name**.onmicrosoft.com/oauth2/authresp
    (where <tenant name> is your tenant name)

1. Select Create. Copy your client ID and client secret. You'll use them when you add the identity provider in the Azure portal.

1. You can leave your project at a publishing status of Testing and add test users to the OAuth consent screen. Or you can select the Publish app button on the OAuth consent screen to make the app available to any user with a Google Account.

#### Task 2 - Configure Azure AD for Google federation

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a user who is assigned a limited administrator directory role or the Guest Inviter role.

1. Select **Azure Active Directory**.

1. Under **Manage**, select **External Identities**.

1. Microsoft provides a direct federation for **Google** as an identity provider.  This can be initiated by selecting **+ Google** from the **External Identities | All identity providers** blade
 
1. After selecting + Google, another blade will open with additional information that is required to configure Google as an identity provider.  

1. Enter the client ID and client secret you obtained earlier. Select Save.

1. This completes the configuration of Google as an identity provider.
# Roberts --> I got a Failed to add Google as a social identity provider message.  No details to let me troublshoot.  Just the failure message.

1. If you used an existing Gmail account, remember to delete the account with **External Identities | All identity providers**. You can also return to the Google developer console and delete the project that you created.


    >**NOTE** - Use this link to complete the steps for finding the Google Client ID and Client secret.
    https://docs.microsoft.com/azure/active-directory/external-identities/google-federation


    > **Note**: Facebook can also easily be configured as an identity provider. These steps can be accessed here: https://docs.microsoft.com/azure/active-directory/external-identities/facebook-federation. If you prefer to use a Facebook account and not Google for this exercise, you may complete this option.

# RobertS - Assuming thet setup works - is there any way to do a quick test?  Log in with a Google account or something?
