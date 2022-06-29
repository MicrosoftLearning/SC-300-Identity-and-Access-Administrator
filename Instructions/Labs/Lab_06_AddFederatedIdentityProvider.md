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

>**Note**: For this exercise, you will need a Gmail account on Google. Create a new Google account and then follow the steps for the exercise.


1. Go to the Google APIs at https://console.developers.google.com, and sign in with your Google account. We recommend that you use a shared team Google account.

1. Accept the terms of service if you're prompted to do so.

1. Create a new project: At the top of the page, select the project menu to open the Select a project page. Choose New Project.  Leave the remaining fields with the default settings.

1. On the New Project page, give the project a name (for example, **MyB2BApp**), and then select **Create**.

1. Open the new project by selecting the link in the Notifications message box or by using the project menu at the top of the page.

1. In the left menu, select **APIs & Services**, and then select **OAuth consent screen**.

1. Under User Type, select **External**, and then select **Create**.

1. On the **OAuth consent screen**, under App information, enter an App name, such as **Azure AD**.

1. Under User support email, select an email address. This should include the email address that you used to log into Google.

1. Under Authorized domains, select **Add domain**, and then add the microsoftonline.com domain.

    ```
    microsoftonline.com
    ```

1. Under Developer contact information, enter the email address for the lab account that you used to sign into the portal.

1. Select **Save and continue**.

1. In the left menu, select **Credentials**.

1. Select **+ Create credentials**, and then select **OAuth client ID**.

1. In the Application type menu, select Web application. Give the application a suitable name, like Azure AD B2B. Under **Authorized redirect URIs**, add the following URIs:

    ```
        - https://login.microsoftonline.com
        - https://login.microsoftonline.com/te/**tenant ID**/oauth2/authresp
        (where <tenant ID> is your tenant ID)
        - https://login.microsoftonline.com/te/**tenant name**.onmicrosoft.com/oauth2/authresp
        (where <tenant name> is your tenant name)
    ```

1. Select Create. Copy your **client ID** and **client secret**. You'll use them when you add the identity provider in the Azure portal.

1. You can leave your project at a publishing status of Testing and add test users to the OAuth consent screen. Or you can select the Publish app button on the OAuth consent screen to make the app available to any user with a Google Account.

#### Task 2 - Configure Azure AD for Google federation

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a user who is assigned a limited administrator directory role or the Guest Inviter role.

1. Select **Azure Active Directory**.

1. Under **Manage**, select **External Identities**.

1. Microsoft provides a direct federation for **Google** as an identity provider.  This can be initiated by selecting **+ Google** from the **External Identities | All identity providers** page
 
1. After selecting + Google, another page will open with additional information that is required to configure Google as an identity provider.  

1. Enter the client ID and client secret you obtained earlier. Select Save.

1. This completes the configuration of Google as an identity provider.

>**Note**: You may receive a failed to add Google as a social identity provider message.  Navigate out of that screen and back to the External Identities and Google should be available in the list.

1. If you used an existing Gmail account, remember to delete the account with **External Identities | All identity providers**. You can also return to the Google developer console and delete the project that you created.


    >**NOTE** - Use this link to complete the steps for finding the Google Client ID and Client secret.
    https://docs.microsoft.com/azure/active-directory/external-identities/google-federation


    > **Note**: Facebook can also easily be configured as an identity provider. These steps can be accessed here: https://docs.microsoft.com/azure/active-directory/external-identities/facebook-federation. If you prefer to use a Facebook account and not Google for this exercise, you may complete this option.

1. Once the setup is complete, you can open a private browser and enter the following web address:

    ```
    login.microsoftonline.com
    ```

1. Enter the **Google** email address and password that you created.  You should then enter the Microsoft online portal for app access.

